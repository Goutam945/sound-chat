import 'package:badges/badges.dart';
import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/CardScreen.dart';
class Backappbar extends PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Color(0xFFE18D13),

     /* title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Shop",style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),

        ],),*/

    );
  }
}
