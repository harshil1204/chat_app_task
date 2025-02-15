part of 'post_bloc.dart';

abstract class PostEvent {}
class AddPost extends PostEvent {
  final String message;
  AddPost(this.message);
}
class LoadPosts extends PostEvent {}