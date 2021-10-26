import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<Coupon> createCouponState({context, String couponid}) async {
  final http.Response response = await http.get(
    Uri.parse('$stripebaseurl/v1/coupons/$couponid'),
    headers: {'Authorization': 'Bearer $secretKey'},
  );
  if (response.statusCode == 200) {
    // dynamic data = json.decode(response.body);
    //print(data);
    return Coupon.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class Coupon with ChangeNotifier {
  dynamic data;

  Coupon({
    this.data,
  });

  Coupon.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
