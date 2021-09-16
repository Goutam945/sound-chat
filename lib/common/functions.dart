import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/livetv.dart';
import 'package:sound_chat/screens/video%20ovrlap/VideoOverlayWidget.dart';
addVideosOverlay(BuildContext context) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => VideoOverlayWidget(
      onClear: () {
        Provider.of<OverlayHandlerProvider>(context, listen: false).removeOverlay(context);
        Provider.of<OverlayHandlerProvider>(context, listen: false).disablePip();
      },
      widget: VideoPlayer(),
    ),
  );

  Provider.of<OverlayHandlerProvider>(context, listen: false).insertOverlay(context, overlayEntry);
  Provider.of<OverlayHandlerProvider>(context, listen: false).enablePip(200/80);
}
