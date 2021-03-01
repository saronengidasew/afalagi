import 'package:Afalagi/user/bloc/story_event.dart';
import 'package:Afalagi/user/bloc/story_state.dart';
import 'package:Afalagi/user/repository/story_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository storyRepository;

  StoryBloc({@required this.storyRepository})
      : assert(StoryRepository != null),
        super(StoryLoading());
  @override
  Stream<StoryState> mapEventToState(StoryEvent event) async* {
    if (event is StoryLoad) {
      yield StoryLoading();
      try {
         print('Storys');

        final storys = await storyRepository.getStory();
        print(storys);
        yield StoryLoadSuccess(storys);
      } catch (_) {
        print('its err');
        yield StoryOperationFailure();
      }
    }
    if (event is StoryCreate) {
      try {
        await storyRepository.createStory(event.story);
        final story = await storyRepository.getStory();
        yield StoryLoadSuccess(story);
      } catch (_) {
        yield StoryOperationFailure();
      }
    }
    if (event is StoryUpdate) {
      try {
        await storyRepository.updateStory(event.story);
        final Story = await storyRepository.getStory();
        yield StoryLoadSuccess(Story);
      } catch (_) {
        yield StoryOperationFailure();
      }
    }

    if (event is StoryDelete) {
      try {
        await storyRepository.deleteStory(event.story.id);
        final story = await storyRepository.getStory();
        yield StoryLoadSuccess(story);
      } catch (_) {
        yield StoryOperationFailure();
      }
    }
  }
}
