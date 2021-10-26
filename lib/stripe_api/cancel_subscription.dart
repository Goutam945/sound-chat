import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<CancelSubscriptionStatusReponse> cancelSubscriptionState(
    {context, subscriptionid}) async {
  final http.Response response = await http.delete(
    Uri.parse('$stripebaseurl/v1/subscriptions/$subscriptionid'),
    headers: {'Authorization': 'Bearer $secretKey'},
  );
  if (response.statusCode == 200) {
    // dynamic data = json.decode(response.body);
    //print(data);

    return CancelSubscriptionStatusReponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class CancelSubscriptionStatusReponse with ChangeNotifier {
  dynamic data;

  CancelSubscriptionStatusReponse({
    this.data,
  });

  CancelSubscriptionStatusReponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
