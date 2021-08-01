import 'package:explore_solar_app/models/planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanetDetailsScreen extends StatefulWidget {
  static final routeName = '/details';

  const PlanetDetailsScreen({Key? key}) : super(key: key);

  @override
  _PlanetDetailsScreenState createState() => _PlanetDetailsScreenState();
}

class _PlanetDetailsScreenState extends State<PlanetDetailsScreen> {
  Planet? _planet;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      _planet = ModalRoute.of(context)?.settings.arguments as Planet;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: _planet == null
            ? Center(child: Text('Error'))
            : SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 180,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                            top: 45,
                            left: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 14,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )),
                        Positioned(
                          top: 10,
                          right: -30,
                          child: Hero(
                              tag: _planet!.image,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 1,
                                        offset: Offset(-10, 30),
                                        blurRadius: 30,
                                        color: Colors.black12,
                                      )
                                    ]),
                                child: Image.asset(
                                  _planet!.image,
                                  width: 165,
                                ),
                              )),
                        ),
                        if (_planet!.num != 0)
                          Positioned(
                              left: 40,
                              top: 75,
                              child: Hero(
                                tag: _planet!.num,
                                child: Text(
                                  '${_planet!.num}',
                                  style: theme.primaryTextTheme.headline6,
                                ),
                              )),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Hero(
                        tag: _planet!.name,
                        child: Text(
                          '${_planet!.name}',
                          style: theme.textTheme.headline5,
                          textAlign: TextAlign.left,
                        )),
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Hero(
                      tag: 'solar',
                      child: Text(
                        'Solar System',
                        style: theme.primaryTextTheme.headline3,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              )),
      ),
    );
  }
}