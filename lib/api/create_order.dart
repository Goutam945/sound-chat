/*import 'dart:convert';
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
    payment_method_title,
    setPaid,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('https://mintok.com/soundchat/wp-json/create_order/v2/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {
        "user_id": id,
        "payment_method": "bacs",
        "payment_method_title": payment_method_title,
        "set_paid": setPaid,
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
}*/
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
    List line_items,
    int id,
    payment_method,
    transaction_id,
    transaction_status,
    total_amount,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('http://3.23.210.57:3000/api/v1/auth/addorder'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {
               "user_id": id,
              "first_name": firstname,
              "last_name": lastname,
              "address_1": address1,
              "address_2": address2,
              "city": city,
              "state": state,
              "postcode": postcode,
              "country": country,
              "email": email,
              "phone": phone,
              "items": line_items,
              "Discount":"20",
              "total_amount":total_amount,
              "payment_method":  payment_method,
               "transaction_id":transaction_id,
              "transaction_status":transaction_status
            // "transaction_id":"5165dfdasdg",
            // "transaction_status":"failed"
          }
          ));

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
