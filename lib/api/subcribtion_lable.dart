import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/AllorderDetails.dart';

Future<SubcriptionlevalResponse> createSubcriptionlevalState(
    int userid, context) async {
  final http.Response response = await http.get(
      Uri.parse(
          'https://mintok.com/soundchat/wp-content/plugins/indeed-membership-pro/apigate.php?ihch=wCKu3yKzZSCqvU93SKlvZC1i6v&action=get_user_levels&uid=$userid'),
      );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
//    int status = data['status'];
//    if(status==200)
    {
//      String message = data['message'];

      print(data);
      Provider.of<SubcriptionlevalResponse>(context, listen: false).data = data;
//      Navigator.of(context)
//          .pushReplacement(MaterialPageRoute(builder: (context) => AllOrderlist()));
//      Toast.show(data.toString(), context,
//          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return SubcriptionlevalResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class SubcriptionlevalResponse with ChangeNotifier {
  dynamic data;

  SubcriptionlevalResponse({
//    this.response,
    this.data,
  });

  SubcriptionlevalResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    data = json;
    notifyListeners();
  }
}
