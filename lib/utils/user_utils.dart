import 'package:delta/application/bloc/auth-bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserUtils {
  static String getCurrentUserName(BuildContext context) {
    final userState = BlocProvider.of<AuthBloc>(context).state;
    if (userState is Authenticated) {
      return userState.user.email!;
    }
    throw Error();
  }
}
