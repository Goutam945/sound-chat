import 'package:sound_chat/common/index.dart';

class Registrationship extends StatefulWidget {
  final plan;
  final lid;
  final productname;

  Registrationship(this.plan, this.lid, this.productname);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Registrationship> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  bool loader = false;

  //Future<SignUpResponse> _futureJwt;
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
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
                    "Complete all fields below to create your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Personal Details",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
                        labelText: "First Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'First Name:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _firstname,
                      validator: Validators.required('Name is required'),
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
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Last Name:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _lastname,
                      validator: Validators.required('Last Name is required'),
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
                        hintText: 'Email Address:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _email,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Email is empty";
                        }
                        if (!validateEmail(value)) {
                          return 'Please Enter a valid Email ID';
                        } else
                          return null;
                      },
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
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Username:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _phone,
                      validator: Validators.required('Username is required'),
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
                          Icons.account_balance_outlined,
                          color: Color(0xFFA6B3BC),
                        ),
                      ),
                      controller: _country,
                      validator: Validators.required('Country is required'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  /* Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 95),
                    child: SizedBox(height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF8E0E14),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            )),
                        onPressed: () {
                          if (formKey.currentState.validate())
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Registrationshipnext(
                                    widget.lid,
                                    widget.user,
                                    _firstname.text,
                                    _lastname.text,
                                    _email.text,
                                    _phone.text,
                                    _country.text)));
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState.validate())
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Registrationshipnext(
                                    widget.lid,
                                    widget.plan,
                                    widget.productname,
                                    _firstname.text,
                                    _lastname.text,
                                    _email.text,
                                    _phone.text,
                                    _country.text)));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                              child: Text(
                            'Continue',
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
                    height: 10,
                  ),
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
