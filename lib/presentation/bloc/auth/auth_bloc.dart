import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthBloc() : super(AuthInitial()) {

    on<CheckUserLoggedIn>((event, emit) async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    });

    on<SignUp>((event, emit) async {
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        await _firestore.collection('users').doc(user.user!.uid).set({
          'username': event.username,
          'email': event.email,
        });
        emit(Authenticated());
      }  on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          emit(AuthError("This email is already registered. Please log in."));
        } else if (e.code == 'weak-password') {
          emit(AuthError("Password is too weak. Choose a stronger password."));
        } else {
          emit(AuthError("Sign-up failed: ${e.message}"));
        }
      }
    });

    on<Logout>((event, emit) async {
      try {
        await FirebaseAuth.instance.signOut();
        emit(AuthLoggedOut());
      } catch (e) {
        emit(AuthError("Logout failed: ${e.toString()}"));
      }
    });


    on<SignIn>((event, emit) async {
      try {
        await _auth.signInWithEmailAndPassword(email: event.email, password: event.password);
        emit(Authenticated());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(AuthError("No user found with this email."));
        } else if (e.code == 'wrong-password') {
          emit(AuthError("Incorrect password. Please try again."));
        } else {
          emit(AuthError("Login failed: ${e.message}"));
        }
      }
    });
  }
}