import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
Future<CancelSubpResponse> createCancelsubcripState(uid,
    context) async {
  final http.Response response = await http.post(
      Uri.parse(baseUrl+'updatesubscriberplan'),
      // headers: <String, String>{"content-type": "application/json"},
      body: {
        'user_id': "$uid",
      });

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
        {

      print(data);
//      Navigator.of(context)
//          .pushReplacement(MaterialPageRoute(builder: (context) => AllOrderlist()));
//       Toast.show(data.toString(), context,
//           duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            showCloseIcon: true,
            animType: AnimType.BOTTOMSLIDE,btnOkColor: Colors.orange,
            title: 'Succes',
            btnOkOnPress: () {Navigator.of(context).pop();
            },
          )..show();
      return CancelSubpResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}
class CancelSubpResponse {
  dynamic data;

  CancelSubpResponse({
//    this.response,
    this.data,
  });

  CancelSubpResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    data = json;
  }
}
