import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    viewportFraction: 0.35
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Slider Demo'),
      ),
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildPage(index);
          },
        ),
      ),
    );
  }

  _buildPage(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          if (value >= 0) {
            double _lowerLimit = 0;
            double _upperLimit = pi / 2; // 90 degree
            
            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit))).clamp(_lowerLimit, _upperLimit);
            value = _upperLimit - value;
            value *= -1;
          }
        } else { // 超出範圍
          if (index == 0) {
            value = 0;
          } else if (index == 1) {
            value = -1;
          }
        }

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(value),
          alignment: Alignment.center,
          child: CreditCard(index),
        );
      },
    );
  }
}

class CreditCard extends StatelessWidget {
  final int index;

  CreditCard(this.index);

  _showCardBGColor(index) {
    if (index % 2 == 0) {
      return Colors.blueAccent;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: _showCardBGColor(index)
      ),
      child: Container(
        child: Center(
          child: Text(
            'Credit Card',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}


