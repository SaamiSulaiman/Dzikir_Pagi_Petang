import 'dart:math';

//saami

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dzikir Pagi"),),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: PageViewWidget(),
          )
        ],
      ),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  List<VacationBean> _list = VacationBean.generate();

  PageController pageController;

  double viewportFraction = 0.8;

  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
    PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            (1 - (pageOffset - index).abs()) + viewportFraction);

        double angle = (pageOffset - index).abs();

        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 20,
            top: 100 - scale * 25,
            bottom: 50,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  _list[index].url,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment((pageOffset - index).abs() * 1, 0),
                ),
                Positioned(
                  bottom: 60,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: Duration(
                      milliseconds: 200,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: _list.length,
    );
  }
}

class VacationBean {
  String url;

  VacationBean(this.url);

  static List<VacationBean> generate() {
    return [
      VacationBean("data/image/1.png"),
      VacationBean("data/image/2.png"),
      VacationBean("data/image/3.png"),
      VacationBean("data/image/4.png"),
      VacationBean("data/image/5.png"),
      VacationBean("data/image/6.png"),
      VacationBean("data/image/7.png"),
      VacationBean("data/image/8.png"),
      VacationBean("data/image/9.png"),
      VacationBean("data/image/10.png"),
      VacationBean("data/image/11.png"),
      VacationBean("data/image/12.png"),
      VacationBean("data/image/13.png"),
      VacationBean("data/image/14.png"),
      VacationBean("data/image/15.png"),
      VacationBean("data/image/16.png"),
      VacationBean("data/image/17.png"),
      VacationBean("data/image/18.png"),
      VacationBean("data/image/19.png"),
    ];
  }
}
