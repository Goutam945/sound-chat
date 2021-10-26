import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<SubscriptionStatusReponse> createSubscriptionStatusState(
    {context, subscriptionid}) async {
  final http.Response response = await http.get(
    Uri.parse('$stripebaseurl/v1/subscriptions/$subscriptionid'),
    headers: {'Authorization': 'Bearer $secretKey'},
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    //print(data);
    // Provider.of<InvoiceReponse>(context, listen: false).data = data;
    return SubscriptionStatusReponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class SubscriptionStatusReponse with ChangeNotifier {
  dynamic data;

  SubscriptionStatusReponse({
    this.data,
  });

  SubscriptionStatusReponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
