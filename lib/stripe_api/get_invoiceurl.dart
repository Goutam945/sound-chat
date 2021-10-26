import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<InvoiceReponse> createInvoiceState({context, invoiceid}) async {
  final http.Response response = await http.get(
    Uri.parse('$stripebaseurl/v1/invoices/$invoiceid'),
    headers: {'Authorization': 'Bearer $secretKey'},
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    //print(data);
    // Provider.of<InvoiceReponse>(context, listen: false).data = data;
    return InvoiceReponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class InvoiceReponse with ChangeNotifier {
  dynamic data;

  InvoiceReponse({
    this.data,
  });

  InvoiceReponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
