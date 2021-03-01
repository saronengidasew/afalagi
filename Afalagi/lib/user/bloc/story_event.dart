import 'package:Afalagi/user/models/story.dart';
import 'package:equatable/equatable.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();
}

class StoryLoad extends StoryEvent {
  const StoryLoad();

  @override
  List<Object> get props => [];
}

class StoryCreate extends StoryEvent {
  final Story story;

  const StoryCreate(this.story);

  @override
  List<Object> get props => [Story];

  @override
  String toString() => 'Story Created {Story: $Story}';
}

class StoryUpdate extends StoryEvent {
  final Story story;

  const StoryUpdate(this.story);

  @override
  List<Object> get props => [Story];

  @override
  String toString() => 'Story Updated {Story: $Story}';
}

class StoryDelete extends StoryEvent {
  final Story story;

  const StoryDelete(this.story);

  @override
  List<Object> get props => [Story];

  @override
  toString() => 'Story Deleted {Story: $Story}';
}
