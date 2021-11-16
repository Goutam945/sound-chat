import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<AudiovideoUrls> createAudiovideoUrlsState(context) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'listlivecontent'), body: {});
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    // print(data);
    Provider.of<AudiovideoUrls>(context, listen: false).addData(data);
    return AudiovideoUrls.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class AudiovideoUrls with ChangeNotifier {
  dynamic data;

  AudiovideoUrls({
    this.data,
  });

  AudiovideoUrls.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
  addData(data) {
    this.data = data;
    notifyListeners();
  }
}
