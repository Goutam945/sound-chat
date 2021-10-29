import 'package:sound_chat/common/index.dart';

class Shopaddress extends StatefulWidget {
  @override
  _ShopaddressState createState() => _ShopaddressState();
}

class _ShopaddressState extends State<Shopaddress> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  bool loader = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _postcode = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFF3F535E),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Billing details",
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
                        labelText: "Address",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Address:',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _address1,
                      validator: Validators.required('Address is required'),
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
                        labelText: "Address1",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Address1:',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _address2,
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
                        labelText: "City",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'City:',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _city,
                      validator: Validators.required('City is required'),
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
                        labelText: "State",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'State:',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _state,
                      validator: Validators.required('State is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "Post code",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        hintText: 'Post code:',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _postcode,
                      validator: Validators.required('Post code is required'),
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
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        hintText: 'Country:',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _country,
                      validator: Validators.required('Country is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                        hintStyle: TextStyle(color: Colors.white),
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
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        labelText: "Phone number",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Phone number:',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      controller: _phone,
                      validator:
                          Validators.required('phone number is required'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF8E0E14),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            )),
                        onPressed: () {
                          if (_formKey.currentState.validate())
                            // Navigator.of(context)
                            //     .pushReplacement(MaterialPageRoute(
                            //     builder: (context) => ShopPay(
                            //       _firstname.text,
                            //       _lastname.text,
                            //       _address1.text,
                            //       _address2.text,
                            //       _city.text,
                            //       _state.text,
                            //       _postcode.text,
                            //       _country.text,
                            //       _email.text,
                            //       _phone.text,
                            //     )));
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ShopPay(
                                      _firstname.text,
                                      _lastname.text,
                                      _address1.text,
                                      _address2.text,
                                      _city.text,
                                      _state.text,
                                      _postcode.text,
                                      _country.text,
                                      _email.text,
                                      _phone.text,
                                    )));
                        },
                        child: Text(
                          " Proceed to Pay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height * 0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.12168,
              width: width * 0.21875,
              child: Image.asset(
                'assets/soundpic.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
