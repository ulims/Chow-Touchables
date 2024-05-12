# Chow Design Touchables

[![Version](https://img.shields.io/pub/v/chow_touchables.svg)](https://pub.dev/packages/chow_touchables) [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org) 

Chow Design System Touchables

## Usage

```dart
import 'package:chow_touchables/chow_touchables.dart';

class ChowApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const  Text('Chow Touchables'),),
         TouchableOpacity(
            onTap: () {},
            onDoubleTap: () {},
            onForcePressEnd: (details) {},
            onLongPress: () {},
            onScaleEnd: (details) {},
            onPanDown: (details) {},
            onHorizontalDragDown: (details) {},
            onTapCancel: () {},

            //you can access other methods
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary),
            ),
          ));
      
  }
}
```




## FAQs

### What is this?

This package gives you access to the Touchableopacity widget. This Package uses the Inkwell to allow interaction and animated to opacity of the widget on touch events.# chow_touchables
