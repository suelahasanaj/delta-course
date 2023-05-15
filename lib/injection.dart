import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delta/application/bloc/auth-bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final firestore = FirebaseFirestore.instance;
const JsonEncoder jsonEncoder = JsonEncoder();

Future<void> init() async {
  // Bloc
  getIt.registerLazySingleton(() => AuthBloc());

  // External
  getIt.registerLazySingleton(() => firestore);
  getIt.registerLazySingleton(() => jsonEncoder);
}
