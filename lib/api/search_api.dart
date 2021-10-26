import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<SearchResponse> createSearchState(search, context) async {
  final http.Response response = await http.get(Uri.parse(
      'https://mintok.com/soundchat/wp-json/search/v2/?search=$search'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<SearchResponse>(context, listen: false).data = data;
    //print(data);
    return SearchResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class SearchResponse with ChangeNotifier {
  dynamic data;

  SearchResponse({
    this.data,
  });

  SearchResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
