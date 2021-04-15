import 'package:sound_chat/api/sendmail.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/ShopPayscreen.dart';

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
}
