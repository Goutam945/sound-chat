import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<MembershipResponse> createMembershipState(context) async {
  final http.Response response =
  await http.post( Uri.parse('http://3.23.210.57:3000/api/v1/auth/listplan'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    print(data);
    Provider.of<MembershipResponse>(context, listen: false).data = data;
    return MembershipResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class MembershipResponse with ChangeNotifier {
  dynamic data;

  MembershipResponse({
    this.data,
  });

  MembershipResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
