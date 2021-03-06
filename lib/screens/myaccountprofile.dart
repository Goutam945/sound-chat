import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sound_chat/api/logout.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/stripe_api/cancel_subscription.dart';

class MyAccount extends StatefulWidget {
  // final email, name;
  // MyAccount(this.email, this.name);
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String email = "";
  String name = "";
  String phone = "";
  String country = "";
  String image = "";
  bool loader = false;
  dynamic data;
  int id;
  Future<int> _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        phone = sharedPreferences.getString('phone');
        country = sharedPreferences.getString('country');
        image = sharedPreferences.getString('image');
        id = sharedPreferences.getInt('id');
        // print("$image $email $name $phone $country $id");
      }
    });
    return id;
  }

  @override
  void initState() {
    super.initState();
    // _loadSavedData().then((value) => print("USERID"+value.toString()));
    _loadSavedData()
        .then((value) => createSubcriptionlevalState(id, context).then((value) {
              setState(() {
                data = value.data['data'];
              });
            }));
  }

  // void remove() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String username = await Sharedpreferences().getUsername();
  //   String password = await Sharedpreferences().getPassword();
  //   await preferences.clear();
  //   Sharedpreferences()
  //       .saveUsernamePassword(username: username, password: password);
  // }

  Future<void> showMyDialog() async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      btnOkColor: Colors.orange,
      title: 'Are You Sure',
      desc: 'Logout?',
      btnCancelOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkOnPress: () {
        //remove();
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => HomeBottomBar()));
        // Toast.show("Successfully Logout", context,
        //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        createLogoutState(context: context, userid: id);
      },
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if (Provider.of<SubcriptionlevalResponse>(context, listen: false).data !=
    //     null)
    //   data = Provider.of<SubcriptionlevalResponse>(context, listen: false)
    //       .data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFF3F535E),
              actions: <Widget>[
                IconButton(
                  icon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    showMyDialog();
                  },
                ),
              ],
            ),
            body: Container(
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF3F535E),
                    Color(0xFF3A432E),
                    //Color(0xFF0E0D13)
                  ])),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Fullview(baseurlimage + image)));
                        },
                        child: Container(
                          width: width * 0.2537,
                          height: height * 0.1553,
                          child: CachedNetworkImage(
                            imageUrl: baseurlimage + image,
                            fit: BoxFit.fill,
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 50,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontfamily),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          phone.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: fontfamily,
                              fontSize: 12),
                        ),
                        // Text(
                        //   country.toString() + ")",
                        //   style: TextStyle(
                        //       color: Colors.white, fontFamily: fontfamily),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Account Details',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: DesignUpdate()));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 0.5,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                'Name: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                'Country: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                'Password:',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              // Text(
                              //   'Update Profile:',
                              //   style: TextStyle(
                              //       fontSize: 14,
                              //       color: Colors.white,
                              //       fontFamily: fontfamily),
                              // ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                email.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                name.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                country.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: ChangePassword()));
                                },
                                child: Text(
                                  "Change Password",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 14),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         PageTransition(
                              //             type: PageTransitionType.rightToLeft,
                              //             child: DesignUpdate()));
                              //   },
                              //   child: Text(
                              //     "Upgrade Profile",
                              //     textAlign: TextAlign.end,
                              //     style: TextStyle(
                              //         color: Colors.green, fontSize: 16),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Subscription Details',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Plan Level:',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                'Expiry Date: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                'Date Purchased: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: fontfamily),
                              ),
                              // Text(
                              //   'Cancel Plan: ',
                              //   style: TextStyle(
                              //       fontSize: 14,
                              //       color: Colors.white,
                              //       fontFamily: fontfamily),
                              // ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          (data != null && data['stripe_status'] != 'INACTIVE')
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data["plan_level"].toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: fontfamily),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 90,
                                      child: Text(
                                        data["plan_expired"].toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: fontfamily),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 90,
                                      child: Text(
                                        data["plan_active"].toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: fontfamily),
                                      ),
                                    ),
                                    /* GestureDetector(
                                        onTap: () => {
                                              setState(() {
                                                loader = true;
                                              }),
                                              cancelSubscriptionState(
                                                  context: context,
                                                  subscriptionid:
                                                      data["subscription_id"]),
                                              createCancelsubcripState(
                                                      id.toString(), context)
                                                  .whenComplete(() {
                                                setState(() {
                                                  loader = false;
                                                });
                                              }),
                                            },
                                        child: Text(
                                          "Cancel Subscription",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.orange),
                                        )),*/
                                  ],
                                )
                              : Text(
                                  "FREE",
                                  style: TextStyle(color: Colors.white),
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /*ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => UpgradeSubscription(
                                          // customerid: data['customer_id'],
                                          // userid: id.toString(),
                                          // subid: data['subscription_id'],
                                          // status: data['stripe_status']
                                          )));
                            },
                            child: Text(
                              "Upgrade membership",
                              style: TextStyle(color: Colors.white),
                            )),*/
                        InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => UpgradeSubscription(
                                          // customerid: data['customer_id'],
                                          // userid: id.toString(),
                                          // subid: data['subscription_id'],
                                          // status: data['stripe_status']
                                          )));
                            },
                            child: Card(
                              color: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Text(
                                  "Upgrade Plan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                        if (data != null && data['stripe_status'] != 'INACTIVE')
                          InkWell(
                              onTap: () => {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.WARNING,
                                      animType: AnimType.BOTTOMSLIDE,
                                      btnOkColor: Colors.red,
                                      title: 'Are You Sure',
                                      desc: 'Cancel Plan ?',
                                      btnCancelOnPress: () {},
                                      btnCancelText: "No",
                                      btnOkText: "Yes",
                                      btnCancelColor: Colors.orange,
                                      btnOkOnPress: () {
                                        setState(() {
                                          loader = true;
                                        });
                                        cancelSubscriptionState(
                                            context: context,
                                            subscriptionid:
                                                data["subscription_id"]);
                                        createCancelsubcripState(
                                                id.toString(), context)
                                            .whenComplete(() {
                                          setState(() {
                                            loader = false;
                                          });
                                        });
                                      },
                                    )..show()
                                  },
                              child: Card(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Text(
                                    "Cancel Plan",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (loader)
            Center(
              child: CircularProgressIndicator(),
            ),
          /*Positioned(
            top: AppBar().preferredSize.height*0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.12168,
              width: width * 0.21875,
              child: Image.asset(
                'assets/soundpic.png',
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

class Fullview extends StatefulWidget {
  final image;
  Fullview(this.image);
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<Fullview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }),
        ),
        body: Center(
          child: Container(
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.image),
            ),
          ),
        ),
      ),
    );
  }
}
