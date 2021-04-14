import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<HomesliderResponse> createHomesliderState(context) async {
  final http.Response response =
  await http.get(Uri.parse('https://mintok.com/soundchat/wp-json/homeslider/v2/?slider_id=12'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<HomesliderResponse>(context, listen: false).data = data;
    return HomesliderResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class HomesliderResponse with ChangeNotifier {
  dynamic data;

  HomesliderResponse({
    this.data,
  });

  HomesliderResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
