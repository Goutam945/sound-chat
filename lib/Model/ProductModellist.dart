import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/cardscreen.dart';

class ProductModellist with ChangeNotifier {
  List<ProductModellist> cart1 = [];
  double sum1 = 0;
  String productname;
  double price;
  String size;
  String color;
  int quantity;
  int id;
  String image;
  int productId;
  int stock;

  ProductModellist(
      [String productname,
      String color,
      double price,
      String size,
      int quantity,
      int id,
      String image,
      int productId,
      int stock]) {
    this.productname = productname;
    this.price = price;
    this.size = size;
    this.color = color;
    this.quantity = quantity;
    this.id = id;
    this.image = image;
    this.productId = productId;
    this.stock = stock;

    notifyListeners();
  }

  void add1(productname, price, size, color, quantity, id, image, productId,
      stock, context) {
    this.cart1.add(ProductModellist(productname, color, price, size, quantity,
        id, image, productId, stock));
    this.sum1 = (this.sum1 + price * quantity);
    notifyListeners();
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardScreen()));
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) => CheckoutScreen()));
  }

  void addbuynow(productname, price, size, color, quantity, id, image,
      productId, context) {
    this.cart1.add(ProductModellist(
        productname, color, price, size, quantity, id, image, productId));
    this.sum1 = (this.sum1 + price * quantity);
    notifyListeners();
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardScreen()));
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft, child: CardScreen()));
  }

  void remove1(i, price, quantity) {
    this.cart1.remove(this.cart1[i]);
    this.sum1 = (this.sum1 - (price * quantity));
    notifyListeners();
  }

  void removeAll() {
    cart1.clear();
    sum1 = 0;
    notifyListeners();
  }
}
