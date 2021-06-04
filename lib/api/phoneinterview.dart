import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<PhoneinterviewResponse> createPhoneinterviewState(context) async {
  final http.Response response =
  await http.post( Uri.parse('http://3.23.210.57:3000/api/v1/auth/listphoneinterviews'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
   // print(response.body.toString());
    Provider.of<PhoneinterviewResponse>(context, listen: false).data = data;
    return PhoneinterviewResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class PhoneinterviewResponse with ChangeNotifier {
  dynamic data;

  PhoneinterviewResponse({
    this.data,
  });

  PhoneinterviewResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
