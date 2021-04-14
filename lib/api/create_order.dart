import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<OrderResponse> createOrderState(
    String firstname,
    String lastname,
    String address1,
    String address2,
    String city,
    String state,
    String postcode,
    String country,
    String email,
    String phone,
    String shipname,
    String shiplastname,
    String shipaddress1,
    String shipaddress2,
    String shipcity,
    String shipsate,
    String shippostcode,
    String shipcountry,
    List line_items,
    int id,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('https://mintok.com/soundchat/wp-json/create_order/v2/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "user_id": id,
        "payment_method": "bacs",
        "payment_method_title": "Direct Bank Transfer",
        "set_paid": true,
        "billing": {
          "first_name": firstname,
          "last_name": lastname,
          "address_1": address1,
          "address_2": address2,
          "city": city,
          "state": state,
          "postcode": postcode,
          "country": country,
          "email": email,
          "phone": phone
        },
        "shipping": {
          "first_name": shipname,
          "last_name": shiplastname,
          "address_1": shipaddress1,
          "address_2": shipaddress2,
          "city": shipcity,
          "state": shipsate,
          "postcode": shippostcode,
          "country": shipcountry
        },
        "line_items": line_items,
        "shipping_lines": [
          {
            "method_id": "flat_rate",
            "method_title": "Flat Rate",
            "total": "10.00"
          }
        ]
      }));

  if (response.statusCode == 200) {
    dynamic orderResponse = json.decode(response.body);
    Provider.of<OrderResponse>(context, listen: false).addData(orderResponse);
    print(orderResponse);
    return OrderResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class OrderResponse with ChangeNotifier {
  dynamic orderResponse;

  OrderResponse([this.orderResponse]);

  OrderResponse.fromJson(Map<String, dynamic> json) {
    this.orderResponse = json;
    notifyListeners();
  }

  addData(orderResponse) {
    this.orderResponse = orderResponse;
    notifyListeners();
  }
}
