import 'package:sound_chat/common/faileddialog.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<Crteatecustomer> createcustomerState(
    {context, firstname, lastname, email, phone, paymentMethod}) async {
  final http.Response response =
      await http.post(Uri.parse('$stripebaseurl/v1/customers'), headers: {
    'Authorization': 'Bearer $secretKey'
  }, body: {
    'name': '$firstname $lastname',
    'address[line1]': '510 Townsend St',
    'address[postal_code]': '98140',
    'address[city]': 'San Francisco',
    'address[state]': 'CA',
    'address[country]': 'US',
    'email': email,
    'phone': phone,
    'payment_method': paymentMethod,
    'invoice_settings[default_payment_method]': paymentMethod,
  });

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    //print(data);
    Provider.of<Crteatecustomer>(context, listen: false).data = data;
    return Crteatecustomer.fromJson(json.decode(response.body));
  } else {
    dynamic data = json.decode(response.body);
    faileddialog(data['error']['message'], context);
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class Crteatecustomer with ChangeNotifier {
  dynamic data;

  Crteatecustomer({
    this.data,
  });

  Crteatecustomer.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
