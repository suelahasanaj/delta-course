import 'package:delta/utils/user_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppbarProfile extends StatefulWidget {
  const AppbarProfile({super.key});

  @override
  State<AppbarProfile> createState() => _AppbarProfileState();
}

class _AppbarProfileState extends State<AppbarProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: false,
            child: Text(
              UserUtils.getCurrentUserName(context),
            ),
          ),
          PopupMenuItem(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const Text('Logout'),
          ),
        ],
        child: const Icon(Icons.person),
      ),
    );
  }
}
