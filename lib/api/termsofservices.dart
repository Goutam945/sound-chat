import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<TermsResponse> createtermsState(context) async {
  final http.Response response =
  await http.get(Uri.parse('https://mintok.com/soundchat/wp-json/terms/v2/?page_id=6433'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<TermsResponse>(context, listen: false).data = data;
    return TermsResponse.fromJson(json.decode(response.body));

  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class TermsResponse with ChangeNotifier {
  dynamic data;

  TermsResponse({
    this.data,
  });

  TermsResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
