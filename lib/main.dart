import 'package:chat_app1/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app1/presentation/bloc/posts/post_bloc.dart';
import 'package:chat_app1/presentation/ui/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()..add(CheckUserLoggedIn())),
        BlocProvider(create: (_) => PostBloc()..add(LoadPosts())),
      ],
      child: MaterialApp(
          title: 'Flutter Chat App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: AuthScreen(),
        ),
    );
  }
}