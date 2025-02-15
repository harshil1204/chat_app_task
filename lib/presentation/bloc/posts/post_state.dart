part of 'post_bloc.dart';

abstract class PostState {}
class PostInitial extends PostState {}
class PostLoaded extends PostState {
  final List<Map<String, dynamic>> posts;
  PostLoaded(this.posts);
}