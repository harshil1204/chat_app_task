import 'package:chat_app1/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app1/presentation/ui/home_screen.dart';
import 'package:chat_app1/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is Authenticated){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.3),
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
        
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.3),
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Enter Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
        
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.3),
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Enter Username',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(SignUp(emailController.text,
                          passwordController.text, usernameController.text));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    child: const Text('Sign Up'),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account yet? ",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child:  const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
