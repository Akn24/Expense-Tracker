import 'package:flutter/material.dart';

class InvestmentDisplayPage extends StatefulWidget {

  final String title;
  final List<dynamic> stock;
  final List<dynamic> mutual;

  const InvestmentDisplayPage({ Key? key, required this.title, required this.stock, required this.mutual}) : super(key: key);

  @override
  State<InvestmentDisplayPage> createState() => _InvestmentDisplayPageState();
}

class _InvestmentDisplayPageState extends State<InvestmentDisplayPage> {
  
  List<dynamic> listOfInvestments=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.title == "Stocks") {
      listOfInvestments = widget.stock;
      print(listOfInvestments);
    } else {
      listOfInvestments = widget.mutual;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + " Portfolio"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listOfInvestments.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(
                listOfInvestments[index]["name"],
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Text(
                listOfInvestments[index]["price"].toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            );
          },
        ),
      ),
    );
  }
}