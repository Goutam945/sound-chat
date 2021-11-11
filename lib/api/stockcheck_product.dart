import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sound_chat/common/appConfig.dart';

Future<OrderstockCheck> orderstockCheckState(List lineitems, context) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'checkproductavailibility'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "carditems": lineitems,
          }));

  if (response.statusCode == 200) {
    dynamic orderResponse = json.decode(response.body);
    print(orderResponse);
    return OrderstockCheck.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class OrderstockCheck {
  dynamic orderResponse;

  OrderstockCheck([this.orderResponse]);

  OrderstockCheck.fromJson(Map<String, dynamic> json) {
    this.orderResponse = json;
  }
}
