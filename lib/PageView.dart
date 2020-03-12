import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MyPage1Widget(),
        MyPage2Widget(),
        MyPage3Widget(),
      ],
    );
  }
}

class MyPage1Widget extends StatefulWidget {
  @override
  _MyPage1WidgetState createState() => _MyPage1WidgetState();
}

class _MyPage1WidgetState extends State<MyPage1Widget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyPage2Widget extends StatefulWidget {
  @override
  _MyPage2WidgetState createState() => _MyPage2WidgetState();
}

class _MyPage2WidgetState extends State<MyPage2Widget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyPage3Widget extends StatefulWidget {
  @override
  _MyPage3WidgetState createState() => _MyPage3WidgetState();
}

class _MyPage3WidgetState extends State<MyPage1Widget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
