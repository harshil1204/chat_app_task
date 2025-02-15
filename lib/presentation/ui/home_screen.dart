import 'package:chat_app1/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app1/presentation/bloc/posts/post_bloc.dart';
import 'package:chat_app1/presentation/ui/auth_screen.dart';
import 'package:chat_app1/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final postController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Social Posts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(Logout());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoggedOut) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()));
            }
          },
          child: Column(
            children: [
              TextField(
                controller: postController,
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
                  hintText: 'Enter Message',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<PostBloc>().add(AddPost(postController.text));
                    postController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  child: const Text('Post'),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocConsumer<PostBloc, PostState>(
                  listener: (context, state) {
                    if (state is AuthLoggedOut) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => AuthScreen()));
                    }
                  },
                  builder: (context, state) {
                    if (state is PostLoaded) {
                      return ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust radius as needed
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(state.posts[index]['username'],style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text(state.posts[index]['message']),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
