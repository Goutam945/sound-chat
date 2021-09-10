/*import 'package:sound_chat/api/sendmail.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/shoppayscreen.dart';

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

  final TextEditingController _shipname = TextEditingController();
  final TextEditingController _shiplastname = TextEditingController();
  final TextEditingController _shipaddress1 = TextEditingController();
  final TextEditingController _shipaddress2 = TextEditingController();
  final TextEditingController _shipcity = TextEditingController();
  final TextEditingController _shipsate = TextEditingController();
  final TextEditingController _shippostcode = TextEditingController();
  final TextEditingController _shipcountry = TextEditingController();

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
              backgroundColor: Color(0xFFE18D13),
              //title: Text("Flutter Http Example"),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: [
                    Text(
                      "Billing details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA19895)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "First Name*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _firstname,
                        validator:
                        Validators.required('First Name is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'First Name',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Last Name*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _lastname,
                        validator: Validators.required('Last Name is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Last Name',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Address1*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _address1,
                        validator: Validators.required('Address1 is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Address1',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Address2",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _address2,
                        // validator: Validators.required(
                        //     'Address2 is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Address2',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "City*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _city,
                        validator: Validators.required('City is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'City',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "State*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _state,
                        validator: Validators.required('State is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'State',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Post Code*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _postcode,
                        validator: Validators.required('Post Code is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Post Code',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Country*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _country,
                        validator: Validators.required('Country is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Country',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _email,
                        validator: Validators.required('Email is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Email',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Phone Number*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _phone,
                        validator:
                        Validators.required('Phone Number is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ship address",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA19895)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "First Name*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _shipname,
                          validator:
                          Validators.required('First Name is required'),
                          decoration: InputDecoration(
                              errorStyle: TextStyle(height: 0.5),
                              hintText: 'First Name',
                              contentPadding: EdgeInsets.only(left: 20)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Last Name*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _shiplastname,
                        validator: Validators.required('Last Name is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Last Name',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Address1*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _shipaddress1,
                        validator: Validators.required('Address1 is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Address1',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Address2",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _shipaddress2,
                        // validator: Validators.required(
                        //     'Address2 is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Address2',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "City*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _shipcity,
                        validator: Validators.required('City is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'City',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "State*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _shipsate,
                        validator: Validators.required('State is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'State',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Post Code*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _shippostcode,
                        validator: Validators.required('Post Code is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Post Code',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Country*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _shipcountry,
                        validator: Validators.required('Country is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Country',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            if (_formKey.currentState.validate())
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                  builder: (context) => ShopPay(
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
                                    _shipname.text,
                                    _shiplastname.text,
                                    _shipaddress1.text,
                                    _shipaddress2.text,
                                    _shipcity.text,
                                    _shipsate.text,
                                    _shippostcode.text,
                                    _shipcountry.text,
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
}*/
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/shoppayscreen.dart';

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
              backgroundColor: Color(0xFFE18D13),
              //title: Text("Flutter Http Example"),
            ),
            body:
            /*Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: [
                    Text(
                      "Billing details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA19895)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "First Name*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _firstname,
                        validator:
                        Validators.required('First Name is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'First Name',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Last Name*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _lastname,
                        validator: Validators.required('Last Name is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Last Name',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Address1*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _address1,
                        validator: Validators.required('Address1 is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Address1',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Address2",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _address2,
                        // validator: Validators.required(
                        //     'Address2 is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Address2',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "City*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _city,
                        validator: Validators.required('City is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'City',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "State*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _state,
                        validator: Validators.required('State is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'State',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Post Code*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _postcode,
                        validator: Validators.required('Post Code is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Post Code',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Country*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _country,
                        validator: Validators.required('Country is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Country',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _email,
                        validator: Validators.required('Email is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Email',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Phone Number*",
                      style: TextStyle(color: Color(0xFFA19895), fontSize: 16),
                    ),
                    Container(
                      color: Colors.white,
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _phone,
                        validator:
                        Validators.required('Phone Number is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            if (_formKey.currentState.validate())
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                  builder: (context) => ShopPay(
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
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),*/

            Form(
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
                        labelText: "First Name",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'First Name:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _firstname,
                      validator: Validators.required('Name is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Last Name:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _lastname,
                      validator: Validators.required('Last Name is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        labelText: "Address",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Address:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _address1,
                      validator: Validators.required('Address is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        labelText: "Address1",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Address1:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _address2,
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        labelText: "City",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'City:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _city,
                      validator: Validators.required('City is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        labelText: "State",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'State:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _state,
                      validator: Validators.required('State is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        labelText: "Post code",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Post code:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _postcode,
                      validator: Validators.required('Post code is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                      ),
                      controller: _country,
                      validator: Validators.required('Country is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        hintText: 'Email:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _email,
                      validator: Validators.required('Email is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        labelText: "Phone number",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Phone number:',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      ),
                      controller: _phone,
                      validator: Validators.required('phone number is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(height: 50,
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
                          Navigator.push(context,
                              PageTransition(type:
                              PageTransitionType.rightToLeft, child:ShopPay(
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
