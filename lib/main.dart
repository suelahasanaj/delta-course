import 'package:delta/application/bloc/auth-bloc/auth_bloc.dart';
import 'package:delta/presentation/style/themes.dart';
import 'package:delta/router/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAbxtG7R8ueB5slHXlDCkB74p2NnPiATqY",
        authDomain: "imb-payment.firebaseapp.com",
        databaseURL: "https://imb-payment.firebaseio.com",
        projectId: "imb-payment",
        storageBucket: "imb-payment.appspot.com",
        messagingSenderId: "269963445243",
        appId: "1:269963445243:web:6b8347c72e861cd438415e",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await injection.init();
  runApp(const Delta());
}

class Delta extends StatefulWidget {
  const Delta({super.key});

  @override
  State<Delta> createState() => _DeltaState();
}

final _appRouter = AppRouter();

class _DeltaState extends State<Delta> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injection.getIt<AuthBloc>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) => previous.runtimeType != current.runtimeType,
        listener: (context, state) {
          if (state is AuthLoadingState || state is AuthInitial || state is Unauthenticated) {
            _appRouter.replace(const AuthPageRoute());
          }
        },
        child: MaterialApp.router(
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          debugShowCheckedModeBanner: false,
          // themeMode: ThemeMode.system,
          theme: Themes.light,
          // darkTheme: Themes.dark,
        ),
      ),
    );
  }
}
