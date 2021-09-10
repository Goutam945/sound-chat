import 'package:badges/badges.dart';
import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/cardscreen.dart';
class ShoppAppbar extends PreferredSize {
  @override
  Widget build(BuildContext context) {
    var cart= context.watch<ProductModellist>();
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Color(0xFF481621),

    title: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text("Shop",style: TextStyle(color: Colors.white, fontSize: 22.0),
    ),

    ],),
      // leading: Builder(
      //     builder: (BuildContext context){
      //       return Image.asset(
      //         'assets/search.png',scale: 2,
      //         color: Colors.white,
      //       );
      //     }),
      actions: <Widget>[
      /*IconButton(
          icon: Stack(
            children: <Widget>[
             Icon(Icons.add_shopping_cart_sharp,size: 40,color: Colors.white,),
              Positioned(
                top: -3.0,
                right: 2.0,
                child: Stack(
                  children: <Widget>[
                     Icon(Icons.brightness_1,
                        size: 22.0, color: Colors.red),
                    Positioned(
                      top: 2.5,
                      right:6.2,
                      child:  Text(cart.cart1.length.toString(),textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            ],
          ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardScreen()));
        },
      ),*/
    Badge(
    position: BadgePosition.topEnd(top: 0, end: 3),
    animationDuration: Duration(milliseconds: 1500),
    animationType: BadgeAnimationType.slide,
    badgeContent: Text(cart.cart1.length.toString(),style: TextStyle(color: Colors.white),),
    child: IconButton(icon: Icon(Icons.shopping_cart,size: 35,),
        onPressed: () {
         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardScreen()));
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType
                      .rightToLeft,
                  child: CardScreen()));
        }),
    ),
      ],
    );
  }
}
