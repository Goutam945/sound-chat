import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<VideoResponse> createVideoState(context) async {
  final http.Response response =
  await http.get( Uri.parse('https://mintok.com/soundchat/wp-json/interview/v2/?post_type=qtvideo'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<VideoResponse>(context, listen: false).data = data;
    return VideoResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class VideoResponse with ChangeNotifier {
  dynamic data;

  VideoResponse({
    this.data,
  });

  VideoResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
