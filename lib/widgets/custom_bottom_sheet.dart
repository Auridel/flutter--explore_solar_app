import 'package:explore_solar_app/providers/planet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  final Function(int page) _animateToPage;

  CustomBottomSheet(this._animateToPage);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    final planets = Provider.of<PlanetProvider>(context, listen: false).items;
    return Container(
      height: 100,
      child: DraggableScrollableActuator(
        child: DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,
          maxChildSize: 0.9,
          builder: (ctx, controller) {
            return Container(
              padding: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
                color: Color(0xff6254ac),
              ),
              child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                itemBuilder: (ctx, idx) {
                  if (idx == 0) {
                    return GestureDetector(
                      onTap: () {
                        DraggableScrollableActuator.reset(ctx);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.grid_view,
                          color: Color(0xffea91cb),
                          size: 20,
                        ),
                        title: Text(
                          'Explore',
                          style: theme.headline4,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      DraggableScrollableActuator.reset(ctx);
                      _animateToPage(idx - 1);
                    },
                    child: ListTile(
                      leading: Image.asset(
                        planets[idx - 1].image,
                        height: 40,
                      ),
                      title: Text(
                        planets[idx - 1].name,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                },
                itemCount: planets.length + 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
