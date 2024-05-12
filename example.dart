import 'package:chow_touchables/src/touchable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChowApp());
}

class ChowApp extends StatefulWidget {
  const ChowApp({super.key});

  @override
  State<ChowApp> createState() => _ChowAppState();
}

class _ChowAppState extends State<ChowApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Chow Icons'),
          ),
          body: TouchableOpacity(
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
          )),
    );
  }
}
