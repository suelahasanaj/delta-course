import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delta/application/classes/organization.dart';
import 'package:delta/injection.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signUp({
    required String email,
    required String password,
    required String organization,
  }) async {
    String res = '';
    try {
      if (email.isNotEmpty && password.isNotEmpty && organization.isNotEmpty) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((user) async {
          DocumentReference orgRef = firestore.collection('organization').doc();
          await orgRef.set(newUserOrg(orgRef.id, user.user!.uid, organization)).then((doc) async {
            await firestore.collection('userDetails').doc(user.user!.uid).set({
              "admin": true,
              "email": email,
              "language": "en",
              "organization": orgRef.id,
              "uid": user.user!.uid,
            });
            res = "success";
            return "success";
          });
        });
      } else {
        return 'Please complete the form';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Weak Password';
      } else if (e.code == 'email-already-in-use') {
        return 'Email already exists';
      } else if (e.code == 'invalid-email') {
        return 'Invalid Email';
      } else if (e.code == 'user-disabled') {
        return 'This user is disabled';
      } else if (e.code == 'operation-not-allowed') {
        return 'This operation is not allowed';
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> signInWithCred({
    required String email,
    required String password,
  }) async {
    String res = '';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      } else {
        res = 'Please complete the form';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'User not found';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password';
      } else if (e.code == 'invalid-email') {
        res = 'Invalid Email';
      } else if (e.code == 'user-disabled') {
        res = 'This user is disabled';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  AuthBloc() : super(AuthInitial()) {
    auth.authStateChanges().listen((User? user) {
      user == null ? add(SignOut()) : add(AuthenticatedEvent(user: user));
    });

    on<SignOut>((event, emit) async {
      emit(Unauthenticated());
    });

    on<SignUp>((event, emit) async {
      emit(AuthInitial());
      await signUp(
        email: event.email,
        password: event.password,
        organization: event.organization,
      );
    });

    on<SignedIn>((event, emit) async {
      emit(Authenticated(user: event.user));
    });
    on<AuthenticatedEvent>((event, emit) async {
      emit(Authenticated(
        user: event.user,
      ));
    });
    on<LoginWithCredentials>((event, emit) async {
      emit(AuthInitial());
      await signInWithCred(
        email: event.email,
        password: event.password,
      );
    });
  }
}
