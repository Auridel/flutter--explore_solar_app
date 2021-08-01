import 'package:explore_solar_app/widgets/pressable_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageViewer extends StatefulWidget {
  static final routeName = '/image-viewer';

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late final String url;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      url = ModalRoute.of(context)?.settings.arguments as String? ?? '';
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  void _onClose(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Hero(tag: url, child: Image.network(url)),
            ),
            Positioned(
              left: 20,
              top: 40,
              child: PressableIcon(Icons.close, Colors.white, _onClose),
            ),
          ],
        ),
      ),
    );
  }
}
