import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<Productname> createproductState(context) async {
  final http.Response response = await http.get(
    Uri.parse('$stripebaseurl/v1/products'),
    headers: {'Authorization': 'Bearer $secretKey'},
  );
  if (response.statusCode == 200) {
    // print(response.body);
    // dynamic data = json.decode(response.body);
    // Provider.of<Productname>(context, listen: false).data = data;
    return Productname.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class Productname with ChangeNotifier {
  dynamic data;

  Productname({
    this.data,
  });

  Productname.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
