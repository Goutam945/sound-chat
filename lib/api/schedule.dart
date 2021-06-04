import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<ScheduleResponse> createScheduleState(context) async {
  final http.Response response =
  await http.post(Uri.parse('http://3.23.210.57:3000/api/v1/auth/listshowschedule'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<ScheduleResponse>(context, listen: false).data = data;
    return ScheduleResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class ScheduleResponse with ChangeNotifier {
  dynamic data;

  ScheduleResponse({
    this.data,
  });

  ScheduleResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
