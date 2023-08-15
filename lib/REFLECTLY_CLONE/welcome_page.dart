import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'helper/animation_item.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<AnimationItem> animationlist = [];
  double _scaleHolder = 0;
  @override
  void initState() {
    super.initState();
    delayAnimatiom(
        AnimationItem(
          name: 'padding_top_label',
          tween: Tween<double>(begin: 0.0, end: 1),
        ),
        const Duration(milliseconds: 800), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
    delayAnimatiom(
        AnimationItem(
          name: 'button_scale',
          tween: Tween<double>(begin: 0.0, end: 0.9),
        ),
        const Duration(milliseconds: 1200), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              children: <Widget>[
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.elasticOut,
                  tween: _scaleHolder == 0.0
                      ? findAnimation('button_scale', 0.0, animationlist)
                      : Tween(begin: 0.9, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value as double,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(0, 10),
                                        blurRadius: 15),
                                  ],
                                ),
                                height: height * 0.075,
                                child: RawMaterialButton(
                                  fillColor: Colors.white,

                                  onHighlightChanged: (press) {
                                    setState(() {
                                      if (press) {
                                        _scaleHolder = 0.1;
                                      } else {
                                        _scaleHolder = 0.0;
                                      }
                                    });
                                  },
                                  hoverColor: Colors.white,
                                  hoverElevation: 0,
                                  highlightColor: Colors.white,
                                  highlightElevation: 0,
                                  elevation: 0,
                                  // color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  onPressed: () {
                                    // widget.pageController?.animateToPage(1,
                                    //     duration:
                                    //         const Duration(milliseconds: 800),
                                    //     curve: Curves.easeInCubic);
                                  },
                                  child: Text(
                                    'HI, REFLECTLY',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                TweenAnimationBuilder(
                    //child: LogoWidget(),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.elasticOut,
                    tween: findAnimation('button_scale', 0.0, animationlist),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value as double,
                        child: const Text(
                          'JÁ TENHO UMA CONTA',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
