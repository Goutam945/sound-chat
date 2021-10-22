import 'index.dart';

int pageIndex = 0;
bool play = true;
bool sound = true;
bool pipDisabled = true;
double hedingfontsize = 14;
double titlefontsize = 16;
double subtitlefontsize = 14;
String fontfamily = "Montserrat";
StreamController<String> streamController =
    StreamController<String>.broadcast();
final String baseUrl = ('http://3.23.210.57:3000/api/v1/auth/');
final String baseurlimage = ('http://3.23.210.57/soundradiobackend/images/');
// const String publicationKey =
//     'pk_test_51IcrCaSGgp78HSWo97V4Z9xHkZ8aYfbJJwA588p5XxmMGQLbESkrNASsxZ5jZlpqUd7xluY1DDkwaJrsarf5XSJt00jZ0YKVIm';
// const String secretKey =
//     'sk_test_51IcrCaSGgp78HSWonqKdKI1a4DBeu3sSN44Yb6kR2yg4XzAsll1AflVCP8fEbhf7dleQj2pjf89QKwZ9EtN9jvWn00h0a5NKH3';
const String stripebaseurl = 'https://api.stripe.com';
const String dummyvideourl =
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
//live key

// const String publicationKey =
//     'pk_live_51JJBMbSJ0AUE5zrJ5lv8x0NNhkPK9ZUYyv87vw0cixf3IRaWP6ngFsO02mgbnw1bZ3sFrt58fHMPLonD7XOmmwtr00wSElwOvE';
// const String secretKey =
//     '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';

//testing key
const String publicationKey =
    'pk_test_51JJBMbSJ0AUE5zrJTcMlsBlZy8TKuVZjzSZTb2sDKfni7wUEJiVaz86jkrk92cB87MKSzGl7z5fDQyIZr4CIlCef00MTBTd9zU';
const String secretKey =
    'sk_test_51JJBMbSJ0AUE5zrJoBKS8JoxZRwbwQP7NJmt54fP1BZ2udXt1qGDeBLSOtPZf1YiE89x2KaPvf79N8Gk5k2qYRgu005Eb0XOUg';

final passwordPattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$';
final emailPattern = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]";
final phoneRegx = "([0-9]{10})";

bool validatePhone(String value) {
  RegExp regxPassword = new RegExp(phoneRegx);
  return regxPassword.hasMatch(value);
}

bool validatePassword(String value) {
  RegExp regxPassword = new RegExp(passwordPattern);
  return regxPassword.hasMatch(value);
}

bool validateEmail(String value) {
  RegExp regxPassword = new RegExp(emailPattern);
  return regxPassword.hasMatch(value);
}
