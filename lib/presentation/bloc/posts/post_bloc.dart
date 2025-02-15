import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PostBloc() : super(PostInitial()) {
    on<AddPost>((event, emit) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await _firestore.collection('users').doc(user.uid).get();
        await _firestore.collection('posts').add({
          'message': event.message,
          'username': userData['username'],
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
    });

    on<LoadPosts>((event, emit) async {
      print("calllllllllll");

      await emit.forEach(
        _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
        onData: (snapshot) {
          final posts = snapshot.docs.map((doc) => doc.data()).toList();
          return PostLoaded(posts);
        },
      );
    });

  }
}
