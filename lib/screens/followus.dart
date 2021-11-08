import 'package:sound_chat/common/index.dart';

class FollowUs extends StatefulWidget {
  @override
  _FollowUsState createState() => _FollowUsState();
}

class _FollowUsState extends State<FollowUs> {
  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(55), child: Backappbar()),
          body: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "FollowUs",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Follow us on Social Media",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await launch("https://www.facebook.com/irishandchin");
                    },
                    child: CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.facebook,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launch("https://twitter.com/irishandchin");
                    },
                    child: CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launch("https://www.instagram.com/soundchatradio/");
                    },
                    child: CircleAvatar(
                      child:
                          Icon(FontAwesomeIcons.instagram, color: Colors.white),
                      backgroundColor: Colors.blueGrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launch(
                          "https://www.youtube.com/channel/UC_JmuNpM4M4wqxoUeBSOMJw/videos");
                    },
                    child: CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                // height: 400,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://i2.wp.com/soundchatradio.com/wp-content/uploads/2019/02/Chin-and-Little-John-.jpg?fit=800%2C1066&is-pending-load=1#038;ssl=1",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          "https://i0.wp.com/soundchatradio.com/wp-content/uploads/2019/10/DSC_7334.jpg?fit=800%2C1204&is-pending-load=1#038;ssl=1",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          "https://i1.wp.com/soundchatradio.com/wp-content/uploads/2019/10/DSC_7077.jpg?fit=800%2C531&is-pending-load=1#038;ssl=1",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          "https://i2.wp.com/soundchatradio.com/wp-content/uploads/2019/06/IMG_6191.jpg?fit=1240%2C1101&is-pending-load=1#038;ssl=1",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ],
                ),
              )
            ],
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
