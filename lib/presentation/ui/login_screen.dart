import 'package:chat_app1/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app1/presentation/ui/auth_screen.dart';
import 'package:chat_app1/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar( title: const Text(
      //   'Login',
      //   style: TextStyle(color: Colors.white),
      // ),
      //   backgroundColor: Colors.grey,),
      body: BlocListener<AuthBloc, AuthState>(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
              ),
              const SizedBox(height: 50),
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
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<AuthBloc>()
                        .add(SignIn(emailController.text, passwordController.text));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  child: const Text('Login'),
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
                          context, MaterialPageRoute(builder: (_) => AuthScreen()));
                    },
                    child:  const Text(
                      "Sign Up",
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
    );
  }
}
