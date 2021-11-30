import 'dart:io';
import 'package:sound_chat/common/index.dart';

class DesignUpdate extends StatefulWidget {
  @override
  _DesignUpdate createState() => _DesignUpdate();
}

class _DesignUpdate extends State<DesignUpdate> {
  //new design
  final formKey = GlobalKey<FormState>();
  bool loader = false;
  int id;
  String phone, userlogin;
  String image;
  Widget oldimage;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  File _image; //variable for choosed file
  final ImagePicker picker = ImagePicker();
  Future<void> getImage() async {
    final XFile image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        id = sharedPreferences.getInt('id');
        _phone.text = sharedPreferences.getString('phone');
        _username.text = sharedPreferences.getString('userlogin');
        _email.text = sharedPreferences.getString('email');
        _name.text = sharedPreferences.getString('name');
        _country.text = sharedPreferences.getString('country');
        image = sharedPreferences.getString('image');
        oldimage = Image.network(
          baseurlimage + image,
          fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return Icon(
              Icons.account_circle,
              size: 70,
            );
          },
        );
      }
    });
  }

  //Future<SignUpResponse> _futureJwt;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _country = TextEditingController();

  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Color(0xFF3F535E),
            //title: Text("Flutter Http Example"),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF3F535E), Color(0xFF3A432E)])),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(
                    "Update Profile",
                    style: TextStyle(
                        fontSize: 19,
                        color: Color(0xFFE18D13),
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Userame:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _username,
                      validator: Validators.required('Userame required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Email:',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _email,
                      validator: Validators.required('Email required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "phone",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Phone:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _phone,
                      validator: Validators.required('phone is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Name:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.supervised_user_circle_sharp,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _name,
                      validator: Validators.required('nicke name is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "Country",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Country:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.home_work_outlined,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _country,
                      validator: Validators.required('Country is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: (true)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                                height: 100,
                                width: 100,
                                child: (_image != null)
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                      )
                                    : oldimage))
                        : Icon(
                            Icons.account_circle,
                            size: 70,
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          )),
                      onPressed: () {
                        getImage();
                      },
                      child: Text(
                        'Upload profile',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            createUpdateState(
                                    id,
                                    _username.text,
                                    _email.text,
                                    _phone.text,
                                    _name.text,
                                    _country.text,
                                    _image,
                                    context)
                                .whenComplete(() {
                              setState(() {
                                loader = false;
                              });
                            });
                            setState(() {
                              loader = true;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                              child: Text(
                            'Update',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (loader)
                    Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: AppBar().preferredSize.height * 0.2,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.10168,
            width: width * 0.20275,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ]),
    );
  }
}
