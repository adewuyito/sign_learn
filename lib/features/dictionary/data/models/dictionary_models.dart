import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_models.freezed.dart';
part 'dictionary_models.g.dart';

class DictionaryEntries {
  final String id;
  final String title;
  final String url;
  final String videoId;
  final Thumbnails thumbnails;

  DictionaryEntries({
    required this.id,
    required this.title,
    required this.url,
    required this.videoId,
    required this.thumbnails,
  });

  factory DictionaryEntries.fromFirebase(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return DictionaryEntries(
      id: id,
      title: json['title'] as String,
      url: json['url'] as String,
      videoId: json['video_id'] as String,
      thumbnails:
          Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return '''DictionaryEntries(
                id: $id, 
                title: $title, 
                url: $url, 
                videoId: $videoId, 
                thumbnails: $thumbnails
              )''';
  }
}

@freezed
class Thumbnails with _$Thumbnails {
  const factory Thumbnails({
    required String high,
    required String medium,
  }) = _Thumbnails;

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);
}

final r = '''
{
  video_id: 7R_aiqAu3Ys, 
  title: feeling, 
  url: https://www.youtube.com/watch?v=7R_aiqAu3Ys, 
  thumbnails: 
    {
      high: https://i.ytimg.com/vi/7R_aiqAu3Ys/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhcIFwoXDAP&rs=AOn4CLAvPQS8-J_ItMH6nwMP-0WVHk6JXw, 
      medium: https://i.ytimg.com/vi/7R_aiqAu3Ys/hqdefault.jpg?sqp=-oaymwE2CPYBEIoBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhcIFwoXDAP&rs=AOn4CLAZLYFQ1lArj-luUIf_-cirDCaNuQ
    }
  }
''';
