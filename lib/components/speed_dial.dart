import 'dart:math';
import 'package:flutter/material.dart';

class SpeedDial extends StatefulWidget {
  bool isOpened = false;
  _SpeedDialState _speedDialState = _SpeedDialState();

  @override
  _SpeedDialState createState() => _speedDialState;

  void close() {
    if (isOpened) _speedDialState.animate();
  }
}

class _SpeedDialState extends State<SpeedDial>
    with SingleTickerProviderStateMixin {
  double angle = 0;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  bool _shouldHaveElevation = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        upperBound: 45 * pi / 180)
      ..addListener(() {
        setState(() {
          angle = _animationController.value;
        });
      });

    _translateButton = Tween<double>(
      begin: 0,
      end: _fabHeight + 14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  void animate() {
    if (!widget.isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    widget.isOpened = !widget.isOpened;
    _shouldHaveElevation = !_shouldHaveElevation;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _getButton(String tooltip, Icon icon, Function onPressedHandler) {
    return Container(
      child: FloatingActionButton(
        onPressed: onPressedHandler,
        tooltip: tooltip,
        child: icon,
        elevation: _shouldHaveElevation ? 6.0 : 0,
      ),
    );
  }

  Widget _getMenuButton(BuildContext context, String tooltip) {
    return FloatingActionButton(
//        onPressed: () => _startAddNewTransaction(context),
      backgroundColor: _buttonColor.value,
      onPressed: animate,
      tooltip: tooltip,
      child: Transform.rotate(
        angle: angle,
        child: Icon(
          Icons.add,
          color: Theme.of(context).textTheme.button.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _buttonColor = ColorTween(
      begin: Theme.of(context).buttonColor,
      end: Theme.of(context).focusColor,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));

    return Positioned(
      top: 10,
      right: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * 2.0,
              8.0,
            ),
            child: _getButton('Income', Icon(Icons.add_box), () {}),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value - _fabHeight,
              9.0,
            ),
            child: _getButton('Expense', Icon(Icons.remove_circle), () {}),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              -2 * _fabHeight,
              10.0,
            ),
            child: _getMenuButton(context, 'Add Transaction'),
          ),
        ],
      ),
    );
  }
}
