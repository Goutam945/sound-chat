import 'package:sound_chat/common/index.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  List ads;

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    CurvedAnimation curve = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {
          // print(animation.value);
          // if(animation.value == 0.0){
          //   if(ads.length < imageIndex){
          //     imageIndex = 0;
          //   } else {
          //     imageIndex++;
          //   }
          // }
        });
      })
      ..addStatusListener((status) {
        // print(status);
        switch (status) {
          case AnimationStatus.completed:
            animationController.reverse();
            break;
          case AnimationStatus.dismissed:
            Provider.of<HomesliderResponse>(context, listen: false).imgIndex();
            // if (imageIndex < ads.length-1) {
            //   setState(() {
            //     imageIndex++;
            //   });
            // } else {
            //   setState(() {
            //     imageIndex = 0;
            //   });
            // }
            animationController.forward();
            break;
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
        }
      });
    // if(ads != null){
    //   animationController.forward();
    //   animationController.repeat(reverse: true);
    // }
  }

  setAds() {
    setState(() {
      ads =
          Provider.of<HomesliderResponse>(context, listen: false).data['data'];
      animationController.forward();
      // animationController.repeat(reverse: true);
    });
  }

  @override
  void initState() {
    createHomesliderState(context).whenComplete(() => setAds());
    animate();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int imageIndex =
        Provider.of<HomesliderResponse>(context, listen: false).imageIndex;
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return (ads != null)
        ? AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: (animationController.value < 0.2) ? 0 : 1,
            child: Container(
              height: shortestSide * 0.8,
              width: shortestSide * 0.9,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0xFF7E737F).withOpacity(1.0),
              //         spreadRadius: 10,
              //         blurRadius: 10,
              //         offset: Offset(0, 0), // changes position of shadow
              //       ),
              //     ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  baseurlimage + ads[imageIndex]['img'],
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        : SizedBox(
            height: shortestSide * 0.8,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
