import 'package:flutter/material.dart';
import 'main.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {

  int totalPoints;

  AnimationController _controller;

  Animation<int> pointsCount;

  Animation<double> bottomOffset1;
  Animation<double> bottomOffset2;
  Animation<double> bottomOffset3;
  Animation<double> bottomOffset4;
  Animation<double> bottomOffset5;
  Animation<double> bottomOffset6;
  Animation<double> bottomOffset7;
  Animation<double> bottomOffset8;
  Animation<double> bottomOffset9;
  Animation<double> bottomOffset10;
  Animation<double> buttonTween;



  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 3000))..addListener(() {
      setState(() {

      });
    })..addStatusListener((status) {

      if (status == AnimationStatus.completed) {
        debugPrint('Init anim!!!!!');
        totalPoints = totalPoints + 10;
        _controller.reset();
      }

    });
    totalPoints = 10;

    pointsCount = IntTween(begin: 0, end: 10).animate(
      new CurvedAnimation(parent: _controller, curve: Curves.linear,),
    );



    bottomOffset1 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.000, 0.400,curve: Curves.easeInCubic)),
    );

    bottomOffset2 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.050, 0.500,curve: Curves.easeInCubic)),
    );

    bottomOffset3 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.100, 0.600,curve: Curves.easeInCubic)),
    );

    bottomOffset4 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.150, 0.700,curve: Curves.easeInCubic)),
    );

    bottomOffset5 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.200, 0.800,curve: Curves.easeInCubic)),
    );

    bottomOffset6 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.250, 0.90,curve: Curves.easeInCubic)),
    );

    bottomOffset7 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.300, 1.000,curve: Curves.easeInCubic)),
    );

    bottomOffset8 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.350, 0.950,curve: Curves.easeInCubic)),
    );

    bottomOffset9 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.400, 0.999,curve: Curves.easeInCubic)),
    );

    bottomOffset10 = Tween<double>(begin: 0, end: 1.0).animate(
      new CurvedAnimation(parent: _controller, curve: Interval(0.450, 1.000,curve: Curves.easeInCubic)),
    );

    TweenSequenceItem scale1 = new TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1.2).chain(CurveTween(curve: Curves.linear)), weight: 10);

    TweenSequenceItem scale2 = new TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.2, end: 1).chain(CurveTween(curve: Curves.linear)), weight: 20);

    TweenSequenceItem scale3 = new TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1.2).chain(CurveTween(curve: Curves.linear)), weight: 20);

    TweenSequenceItem scale4 = new TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.2, end: 1).chain(CurveTween(curve: Curves.linear)), weight: 10);

    TweenSequenceItem scale5 = new TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1.2).chain(CurveTween(curve: Curves.linear)), weight: 20);

    TweenSequenceItem scale6 = new TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.2, end: 1).chain(CurveTween(curve: Curves.elasticOut)), weight: 20);

    buttonTween = TweenSequence(<TweenSequenceItem<double>>[
      scale1,
      scale2,
      scale3,
      scale4,
      scale5,
      scale6
    ]).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end,

        children: <Widget>[


            Stack(overflow: Overflow.visible,fit: StackFit.loose,children: <Widget>[
              getDropEffect(bottomOffset1.value),
              getDropEffect(bottomOffset2.value),
              getDropEffect(bottomOffset3.value),
              getDropEffect(bottomOffset4.value),
              getDropEffect(bottomOffset5.value),
              getDropEffect(bottomOffset6.value),
              getDropEffect(bottomOffset7.value),
              getDropEffect(bottomOffset8.value),
              getDropEffect(bottomOffset9.value),
              getDropEffect(bottomOffset10.value),
              getEmitterText(1, bottomOffset1.value),
              getEmitterText(2, bottomOffset2.value),
              getEmitterText(3, bottomOffset3.value),
              getEmitterText(4, bottomOffset4.value),
              getEmitterText(5, bottomOffset5.value),
              getEmitterText(6, bottomOffset6.value),
              getEmitterText(7, bottomOffset7.value),
              getEmitterText(8, bottomOffset8.value),
              getEmitterText(9, bottomOffset9.value),
              getEmitterText(10, bottomOffset10.value),
              GestureDetector(
                onTapDown: (_) async {
                  debugPrint('Button clicked');
                  _controller.forward();
                },
                child: Transform.scale(scale: buttonTween.value,
                  child: Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 176, 84, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(Icons.star,color: Colors.white,),
                  ),
                ),
              ),
            ],),

          Padding(padding: EdgeInsets.only(top:10), child: Text(
            (totalPoints+pointsCount.value).toString(), style: TextStyle(color: Colors.orange),
          ),),

        ],

      );
  }

  Widget getEmitterText(int number,double bottom) {

    return Positioned(bottom: bottom*500+10,left: 10-70*bottom,
      child: Opacity(opacity:  1-bottom,
        child: Text(
          '+${number.toString()}',
          style: TextStyle(
            fontSize: 30*bottom+15,
            color: [Colors.red, Colors.yellow, Colors.blue, Colors.white, Colors.orange][random.nextInt(5)],
            fontWeight: FontWeight.normal
          ),
        ),
      ),
    );

  }


  Widget getDropEffect(double scale) {

    return Positioned(bottom: 25,left: 25,
      child: Opacity(opacity: 1-scale,
        child: Transform.scale(scale: scale*50,
          child: Container(
            height: 5,width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: [Colors.red, Colors.yellow, Colors.blue, Colors.white, Colors.orange][random.nextInt(5)].withOpacity(0.5),
            ),
        ),),
      ),
    );

  }

}
