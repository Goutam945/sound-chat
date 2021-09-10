import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sound_chat/common/index.dart';

import 'registrationshipnext.dart';

class Registrationship extends StatefulWidget {
  final user;
  final lid;

  Registrationship(this.user, this.lid);

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
  bool _isObscure = true;
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
                        style: TextStyle(fontSize: 16, color: Color(0xFFA79A9A)),
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
                      style: TextStyle(color: Colors.white, fontFamily: fontfamily),
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
                      style: TextStyle(color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        hintText: 'Last Name:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color(0xFFA79A9A),
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
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Email Address:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(
                          Icons.alternate_email,
                          color: Color(0xFFA79A9A),
                        ),
                      ),
                      controller: _email,
                      validator: Validators.required('Email Address is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Phone:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(
                          Icons.phone_android,
                          color: Color(0xFFA79A9A),
                        ),
                      ),
                      controller: _phone,
                      validator: Validators.required('Phone is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: "Country",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Country:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(
                          Icons.account_balance_outlined,
                          color: Color(0xFFA79A9A),
                        ),
                      ),
                      controller: _country,
                      validator: Validators.required('Country is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  /*Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.2),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                        ),
                        Text("Sign up with Google",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFE18D13),
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )*/

                  /* Column(
                      children: [
                        SizedBox(height: 40,),
                        Text("Member Registration",style: TextStyle(fontSize: 19,color: Colors.white),),
                        SizedBox(height: 10,),
                        Text("Complete all fields below to create your account:",style: TextStyle(fontSize: 16,color: Colors.white),),
                        SizedBox(height: 10,),
                        Text("Personal Details",style: TextStyle(fontSize: 19,color: Colors.white),),
                        SizedBox(height: 10,),

                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                              children: [
                            Container(color: Color(0xFF464646),
                              child: TextFormField( style: TextStyle(color: Colors.white),
                                controller: _firstname,
                                validator: Validators.required(
                                    'Name is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5,),
                                    hintText: 'First Name:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(color: Color(0xFF464646),
                              child: TextFormField(  style: TextStyle(color: Colors.white),
                                controller: _lastname,
                                validator: Validators.required(
                                    'Last Name is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                    hintText: 'Last Name:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Contact Details",style: TextStyle(fontSize: 19),),
                            SizedBox(height: 10,),
                            Container(color: Color(0xFF464646),
                              child: TextFormField(  style: TextStyle(color: Colors.white),
                                controller: _email,
                                validator: Validators.required(
                                    'Email is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                    hintText: 'Email Address:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(color: Color(0xFF464646),
                              child: TextFormField(  style: TextStyle(color: Colors.white),
                                controller: _phone,
                                validator: Validators.required(
                                    'Phone is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                    hintText: 'Phone:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(color: Color(0xFF464646),
                              child: TextFormField(  style: TextStyle(color: Colors.white),
                                controller: _country,
                                validator: Validators.required(
                                    'Country is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                    hintText: 'Country:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                            ]
                          ),
                        ),
                      ),
                        SizedBox(height: 10,),
                        ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14) ),
                          onPressed: () {
                            if (formKey.currentState.validate())
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Registrationshipnext(widget.user,_firstname.text,_lastname.text,_email.text,_phone.text,_country.text)));
                          },
                          child: Text('Continue',style: TextStyle(fontSize: 16),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          color: Color(0xFF4472C4),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.2),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  'assets/gp.gif',
                                  color: Colors.red,
                                ),
                              ),
                              Text("Sign up with Google",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),*/
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: AppBar().preferredSize.height*0.1,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.13168,
            width: width * 0.21875,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ]),
    );
  }
}
