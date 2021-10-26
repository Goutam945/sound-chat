import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<UpgradeSubscriptionResponse> createUpgradeSubscriptionState(
    {uid,
    lid,
    status,
    invoiceid,
    amount,
    currencytype,
    plantype,
    customerid,
    subscriptionid,
    subscriptionmethod,
    currentdate,
    expireddate,
    level,
    context}) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'updatesubscriberplan'), body: {
    'user_id': "$uid",
    'plan_id': "$lid",
    'payment_status': status,
    'invoice_id': invoiceid,
    'amount': amount,
    'currency_type': currencytype,
    'plan_type': plantype,
    'customer_id': customerid,
    'subscription_id': subscriptionid,
    'subscription_method': subscriptionmethod,
    'currentdate': currentdate,
    'expireddate': expireddate,
    'plan_level': level
  });
  if (response.statusCode == 200) {
    // var data = json.decode(response.body);
    {
      // print(data);
      return UpgradeSubscriptionResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class UpgradeSubscriptionResponse with ChangeNotifier {
  dynamic data;

  UpgradeSubscriptionResponse({
//    this.response,
    this.data,
  });

  UpgradeSubscriptionResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    data = json;
    notifyListeners();
  }
}
