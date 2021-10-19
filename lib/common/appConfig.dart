import 'index.dart';

int pageIndex = 0;
bool play = true;
bool sound = true;
bool pipDisabled = true;
double hedingfontsize = 14;
double titlefontsize = 16;
double subtitlefontsize = 14;
String fontfamily = "Montserrat";
GlobalKey<VideoState> globalKey = GlobalKey();
final String baseUrl = ('http://3.23.210.57:3000/api/v1/auth/');
final String baseurlimage = ('http://3.23.210.57/soundradiobackend/images/');
const String publicationKey =
    'pk_test_51IcrCaSGgp78HSWo97V4Z9xHkZ8aYfbJJwA588p5XxmMGQLbESkrNASsxZ5jZlpqUd7xluY1DDkwaJrsarf5XSJt00jZ0YKVIm';
const String secretKey =
    'sk_test_51IcrCaSGgp78HSWonqKdKI1a4DBeu3sSN44Yb6kR2yg4XzAsll1AflVCP8fEbhf7dleQj2pjf89QKwZ9EtN9jvWn00h0a5NKH3';
const String stripebaseurl = 'https://api.stripe.com';
const String dummyvideourl =
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
