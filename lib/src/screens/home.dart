import 'package:animation/src/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  @override
  void initState() {
    super.initState();
    catController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: catController, curve: Curves.easeIn),
    );
  }

  void onTap() {
    catController.isCompleted
        ? catController.reverse()
        : catController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Stack(children: [
            buildCatAnimation(),
            buildBox(),
          ]),
        ),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value),
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.brown,
    );
  }
}
