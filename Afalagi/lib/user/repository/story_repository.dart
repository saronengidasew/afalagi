import 'package:Afalagi/user/data_provider/story_data.dart';
import 'package:Afalagi/user/models/story.dart';
import 'package:meta/meta.dart';


class StoryRepository {
  final StoryDataProvider dataProvider;

  StoryRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Story> createStory(Story Story) async {
        

    return await dataProvider.createStory(Story);
  }

  Future<List<Story>> getStory() async {
   // print('repo');
    List<Story> story = await dataProvider.getStory();
    //print('Story');
    return story;
  }

  Future<void> updateStory(Story story) async {
    await dataProvider.updateStory(story);
  }

  Future<void> deleteStory(String id) async {
    await dataProvider.deleteStory(id);
  }
}
