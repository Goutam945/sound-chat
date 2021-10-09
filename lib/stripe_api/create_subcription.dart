import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<CreateSubscription> createSubscriptionstripeState(
    {context, customer, priceid}) async {
  final http.Response response =
      await http.post(Uri.parse('$stripebaseurl/v1/subscriptions'), headers: {
    'Authorization': 'Bearer $secretKey'
  }, body: {
    'customer': customer,
    'items[0][plan]': priceid,
    'trial_from_plan': 'true',
  });

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    print(data);
    Provider.of<CreateSubscription>(context, listen: false).data = data;
    return CreateSubscription.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class CreateSubscription with ChangeNotifier {
  dynamic data;

  CreateSubscription({
    this.data,
  });

  CreateSubscription.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
