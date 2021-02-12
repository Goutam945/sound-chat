import 'package:sound_chat/common/index.dart';

class DesignLogin extends StatefulWidget {
  @override
  _DesignLogin createState() => _DesignLogin();
}

class _DesignLogin extends State<DesignLogin> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
                height: height,
                width: width,
                child: Image.asset(
                  "assets/soundbg.png",
                  fit: BoxFit.fill,
                )),
          ),
          ListView(
            children: [
              Image.asset(
                "assets/soundpic.png",
                width: width * 0.316,
                height: height * 0.1902,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME TO  ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "SOUNDCHAT RADIO",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.04389,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.black,
                    height: height * 0.2048,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 45,
                          color: Colors.white,
                        ),
                        Icon(Icons.lock, size: 45, color: Colors.white),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: _name,
                                    validator:
                                        Validators.required('Name is required'),
                                    decoration: InputDecoration(
                                        hintText: 'UserName/Email',
                                        contentPadding:
                                            EdgeInsets.only(left: 20)),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: _password,
                                    obscureText: _isObscure,
                                    validator: Validators.compose([
                                      Validators.required(
                                          'Password is required'),
                                      Validators.patternString(
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                          'Invalid Password')
                                    ]),
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        contentPadding:
                                            EdgeInsets.only(left: 20, top: 15),
                                        suffixIcon: GestureDetector(
                                            child: Icon(_isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onTap: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            })),
                                  )),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, top: 5),
                                  child: Text(
                                    "Reset Password",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState.validate())
                    createLoginState(_name.text, _password.text, context);
                },
                child: Container(
                    height: height * 0.0512,
                    color: Color(0xFF15853B),
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: height * 0.0585,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont's have an account? ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupPage()));
                    },
                    child: Column(
                      children: [
                        Text(
                          "REGISTER NOW",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: height * 0.0024,
                          width: width * 0.316,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.0219,
              ),
              Text(
                "Become a patron today for only \$4.99 per month \n and get exclusive access to interviews with your \n favourate  artiste and past show missed",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.0219,
              ),
              Container(
                color: Colors.red,
                margin: EdgeInsets.only(
                    right: width * 0.24305, left: width * 0.24305),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/google.png',
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                    Text("Sign in with Google",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04389,
              ),
              Text("CONTINUE AS GUEST",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF66BA5F),
                  ),
                  textAlign: TextAlign.center)
            ],
          )
        ],
      ),
    );
  }
}
