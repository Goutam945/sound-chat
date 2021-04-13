import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<SubscriptionResponse> createSubscriptionState(uid,lid,context) async {
  final http.Response response = await http.get(Uri.parse(
      'https://mintok.com/soundchat/wp-content/plugins/indeed-membership-pro/apigate.php?ihch=wCKu3yKzZSCqvU93SKlvZC1i6v&action=user_add_level&uid=$uid&lid=$lid'),);
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    print(data);
    // Provider.of<SubscriptionResponse>(context, listen: false).data = data;
    return SubscriptionResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class SubscriptionResponse {
  dynamic data;

  SubscriptionResponse({
    this.data,
  });

  SubscriptionResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    // notifyListeners();
  }
}
