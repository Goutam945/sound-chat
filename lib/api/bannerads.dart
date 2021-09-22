import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<BanneradsResponse> createBanneradsState(context) async {
  final http.Response response =
  await http.post(Uri.parse(baseUrl+'adsbanner')
      , body: {
      }
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<BanneradsResponse>(context, listen: false).data = data;
    return BanneradsResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class BanneradsResponse with ChangeNotifier {
  dynamic data;

  BanneradsResponse({
    this.data,
  });

  BanneradsResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
