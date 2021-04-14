import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/DesignProfile.dart';
import 'package:sound_chat/screens/Myaccountprofile.dart';
import 'package:sound_chat/screens/NewLogin.dart';
import 'package:sound_chat/screens/ProfilePage.dart';
class Appbar extends PreferredSize {
  final email,name;
  Appbar(this.email,this.name);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFFE18D13),
      leading: Builder(
          builder: (BuildContext context){
            return Image.asset(
              'assets/search.png',scale: 2,
              color: Colors.white,
            );
          }),
      actions: <Widget>[
        IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Image.asset(
              'assets/user.png',
              color: Colors.white,
            ),
          ),
          onPressed: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?DesignLogin():DesignProfile(email,name)));
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():MyAccount(email,name)));
          },
        ),
      ],
    );
  }
}
