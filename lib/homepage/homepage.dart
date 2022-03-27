import 'package:expense_tracker/data/homedummy.dart';
import 'package:expense_tracker/investment_display_page/investment_display_page.dart';
import 'package:expense_tracker/services/services.dart';
import 'package:expense_tracker/transactions/transaction_homepage.dart';
import 'package:expense_tracker/widgets/homeappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int _selectedIndex = 0;

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
    // TODO: implement initState
    super.initState();
    fetchStockList();
    fetchMutualList();
  }

  var stockList = [];
  var mutualList = [];
  num sumStock = 0;
  num mutualPrice = 0;

  void fetchStockList() async{
    stockList = await Network().getStockList();
    print(stockList);
    
    for(int i=0;i<stockList.length;i++){
      sumStock+=(stockList[i]["units"]*stockList[i]["price"])!;
    }
    print(sumStock.toString());
    
    if(mounted){
      setState(() {
      sumStock;
      stockList;
    });
    }
    
  }

  void fetchMutualList() async{
    mutualList = await Network().getMutualList();
    print(mutualList);
    
    for(var i=0;i<mutualList.length;i++){
      mutualPrice+=(mutualList[i]["units"]*mutualList[i]["price"])!;
    }
    print(mutualPrice.toString());
    
    if(mounted){
      setState(() {
      mutualList;
      mutualPrice;
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          elevation: 5,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
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
          flexibleSpace: const HomeAppBar(),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: HomeBody(size: size, stock: stockList, mutual: mutualList, sumStock: sumStock, mutualPrice: mutualPrice),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final List<dynamic> stock;
  final List<dynamic> mutual;
  final num sumStock;
  final num mutualPrice;
  const HomeBody({
    Key? key,
    required this.size,
    required this.stock,
    required this.mutual,
    required this.sumStock,
    required this.mutualPrice,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.black,
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Balance",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "\$12,345",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          SizedBox(
            width: size.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: size.width * 0.475,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InvestmentDisplayPage(title: investmentCards[index], stock: stock, mutual: mutual)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          index==0 ? Text(
                            "\$${sumStock.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.bodyText1,
                          ) : 
                          Text(
                            "\$${mutualPrice.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            investmentCards[index],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          Text(
            "Top Categories",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )
          ),

          const SizedBox(
            height: 16,
          ),

          SizedBox(
            height: 225,
            width: size.width,
            child: Card(
              elevation: 5,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      categories[index]["name"],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: LinearProgressIndicator(
                      value: categories[index]["value"].toDouble(),
                    ),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}

