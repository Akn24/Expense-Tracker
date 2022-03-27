import 'package:expense_tracker/homepage/homepage.dart';
import 'package:flutter/material.dart';

import '../services/services.dart';

class TransactionHomePage extends StatefulWidget {
  const TransactionHomePage({ Key? key }) : super(key: key);

  @override
  State<TransactionHomePage> createState() => _TransactionHomePageState();
}

class _TransactionHomePageState extends State<TransactionHomePage> {


  int _selectedIndex = 1;

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  if(_selectedIndex == 0) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }
  else if(_selectedIndex == 1){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TransactionHomePage()));
  }
}

 @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  List<dynamic> res = [];
  void fetchTransactions() async{
    res = await Network().getTransactions();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey[100],
            elevation: 5,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt_long_outlined,
                  size: 30,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "",
              ),
            ],
            onTap: _onItemTapped,
          ),
        appBar: AppBar(
          elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 100,
            flexibleSpace: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
              )
            ),
            child: Center(child: Text(
              "Transactions",
              style: Theme.of(context).textTheme.bodyText1,
            )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
         onPressed: () {},
          child: const Icon(Icons.sms),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children : [
                Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                height: 150,
                width: size.width,
                child: Card(
                  color: Colors.black,
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children : [
                          Text(
                            "Income",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "\$12.3K",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                      ),
                      Column(
                        children : [
                          Text(
                            "Expenses",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "\$12.3K",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
                ListView.builder(
                  itemCount: res.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: res[index]["price"],
                      trailing: res[index]["price"],
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}