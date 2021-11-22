import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/provider/providerHandler.dart';
import 'package:sound_chat/screens/livetv.dart';
import 'package:sound_chat/provider/VideoOverlayWidget.dart';

addVideosOverlay(BuildContext context) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => VideoOverlayWidget(
      onClear: () {
        Provider.of<OverlayHandlerProvider>(context, listen: false)
            .removeOverlay(context);
        Provider.of<OverlayHandlerProvider>(context, listen: false)
            .disablePip();
      },
      widget: VideoPlayer(),
    ),
  );

  Provider.of<OverlayHandlerProvider>(context, listen: false)
      .insertOverlay(context, overlayEntry);
  Provider.of<OverlayHandlerProvider>(context, listen: false)
      .enablePip(200 / 80);
}

class Constants {
  static const double BOTTOM_PADDING_PIP = 16;
  static const double VIDEO_HEIGHT_PIP = 200;
  static const double VIDEO_TITLE_HEIGHT_PIP = 70;
}

int getschedule({context, data}) {
  Duration duration = Duration(hours: 9, minutes: 30);
  //if (Provider.of<ScheduleResponse>(context, listen: false).data != null)
  //var timeAndDate = Provider.of<ScheduleResponse>(context, listen: false).data['data'];
  int weekday = 7 - DateTime.now().subtract(duration).weekday;
  var startTime;
  var endTime;
  if (data != null)
    for (int i = 0; i < data[weekday]['scheduleperdays'].length; i++) {
      startTime =
          DateTime.now().subtract(duration).toIso8601String().split('T')[0] +
              ' ' +
              data[weekday]['scheduleperdays'][i]['show_start_date'];
      endTime =
          DateTime.now().subtract(duration).toIso8601String().split('T')[0] +
              ' ' +
              data[weekday]['scheduleperdays'][i]['show_end_date'];
      DateTime a = DateTime.parse(startTime);
      DateTime b = DateTime.parse(endTime);
      DateTime c = DateTime.now().subtract(duration);
      //  print("$a, $b, $c");
      if (c.isAfter(a) && c.isBefore(b)) {
        // setState(() {
        //   showtime = i;
        // });
        //  print("TIME" + i.toString());
        //print("$a, $b, $c");
        return i;
      }
    }
  return 0;
}

String getDiscountPrice(double price, int discount) {
  return (price - double.parse((price * discount / 100).toStringAsFixed(2)))
      .toString();
}
