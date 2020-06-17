import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_slider.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';
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
  final PageController _pageController = PageController(viewportFraction: 0.35);
  final List<CreditCard> _creditCards = [
    CreditCard(
      cardBackground: SolidColorCardBackground(Colors.red),
      cardNetworkType: CardNetworkType.visaBasic,
      cardHolderName: 'Kaohsiung Medical University',
      cardNumber: '1234 5678 1234 5678',
      company: CardCompany.hdfc,
      validity: Validity(
          validFromMonth: 1,
          validFromYear: 16,
          validThruMonth: 1,
          validThruYear: 21),
    ),
    CreditCard(
      cardBackground: GradientCardBackground(LinearGradient(
          colors: [Color(0xFF4AA3F2), Color(0xFFAF92FB)],
          stops: [0.3, 0.95],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight)),
      cardNetworkType: CardNetworkType.visaBasic,
      cardHolderName: 'Kaohsiung Medical University',
      cardNumber: '1234 5678 1234 5678',
      showChip: false,
      company: CardCompany.citiBank,
      validity: Validity(
          validFromMonth: 1,
          validFromYear: 16,
          validThruMonth: 1,
          validThruYear: 21),
      numberColor: Colors.black,
      validityColor: Colors.black,
      cardHolderNameColor: Colors.black,
    ),
    CreditCard(
      cardBackground: ImageCardBackground(AssetImage('assets/images/bg2.jpg')),
      cardNetworkType: CardNetworkType.visaBasic,
      cardHolderName: 'Kaohsiung Medical University',
      cardNumber: '1234 5678 1234 5678',
      company: CardCompany.hsbc,
      validity: Validity(
          validFromMonth: 1,
          validFromYear: 16,
          validThruMonth: 1,
          validThruYear: 21),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Slider Demo'),
      ),
      body: Center(
        child: CreditCardSlider(
          _creditCards,
          percentOfUpperCard: pi / 2,
        ),
      ),
    );
  }
}
