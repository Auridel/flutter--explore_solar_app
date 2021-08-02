import 'package:explore_solar_app/widgets/pressable_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageViewer extends StatefulWidget {
  static final routeName = '/image-viewer';

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late final List<String> images;
  late final int imageIdx;
  late final PageController _controller;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      images = args['images'];
      imageIdx = args['imageIdx'];
      _controller = PageController(
        initialPage: imageIdx
      );
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
            Dismissible(
              direction: DismissDirection.down,
              key: const Key('imageViewer'),
              onDismissed: (_) {
                Navigator.of(context).pop();
              },
              child: PageView.builder(
                controller: _controller,
                itemBuilder: (ctx, idx) => InteractiveViewer(
                  child: Center(
                    child: Hero(tag: images[idx], child: Image.network(images[idx])),
                  ),
                ),
                itemCount: images.length,
              ),
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
