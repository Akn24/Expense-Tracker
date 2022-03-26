import 'package:flutter/material.dart';

class InvestmentDisplayPage extends StatefulWidget {

  final String title;

  const InvestmentDisplayPage({ Key? key, required this.title }) : super(key: key);

  @override
  State<InvestmentDisplayPage> createState() => _InvestmentDisplayPageState();
}

class _InvestmentDisplayPageState extends State<InvestmentDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + " Portfolio"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(),
      ),
    );
  }
}