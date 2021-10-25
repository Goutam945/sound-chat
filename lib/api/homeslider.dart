import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<HomesliderResponse> createHomesliderState(context) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'homeslider'), body: {
    "slider_id": "1",
  });
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
  int imageIndex = 0;

  HomesliderResponse({
    this.data,
  });

  HomesliderResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
  imgIndex() {
    if (imageIndex < data["data"].length - 1) {
      imageIndex++;
    } else {
      imageIndex = 0;
    }
    print("$imageIndex ${data["data"].length}");
    notifyListeners();
  }
}
