import 'dart:async';

import 'package:chat_app1/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app1/presentation/ui/auth_screen.dart';
import 'package:chat_app1/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          } else if (state is Unauthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => AuthScreen()),
            );
          }

        },
        builder: (context, state) {
          return const Center(
            child: FlutterLogo(size: 80), // Increased size for better visibility
          );
        },
      ),
    );
  }
}
