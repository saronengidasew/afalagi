import 'package:Afalagi/user/models/story.dart';
import 'package:equatable/equatable.dart';

class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}
class StoryLoading extends StoryState {}

class StoryLoadSuccess extends StoryState {
  final List<Story> storys;

  StoryLoadSuccess([this.storys = const []]);

  @override
  List<Object> get props => [storys];
}

class StoryOperationFailure extends StoryState {}
