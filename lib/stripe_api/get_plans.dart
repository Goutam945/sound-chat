import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<Plans> createplansState(context) async {
  final http.Response response = await http.get(
    Uri.parse('$stripebaseurl/v1/plans'),
    headers: {'Authorization': 'Bearer $secretKey'},
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<Plans>(context, listen: false).data = data;
    return Plans.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class Plans with ChangeNotifier {
  dynamic data;

  Plans({
    this.data,
  });

  Plans.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
