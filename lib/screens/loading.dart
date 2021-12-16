import 'package:aaveg_app/screens/background.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animController.repeat();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(children: [
        const Background(),
        Center(
          child: AnimatedBuilder(
            animation: _animController,
            child: SizedBox(
              height: 88.0,
              width: 88.0,
              child: Image.asset('assets/images/aavegwhite.png'),
            ),
            builder: (BuildContext context, Widget _widget) => Transform.rotate(
              angle: _animController.value * 6.3,
              child: _widget,
            ),
          ),
        )
      ]);
}
