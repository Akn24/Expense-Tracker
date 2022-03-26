import 'package:expense_tracker/data/homedummy.dart';
import 'package:expense_tracker/investment_display_page/investment_display_page.dart';
import 'package:expense_tracker/widgets/homeappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          elevation: 5,
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
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          flexibleSpace: const HomeAppBar(),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: HomeBody(size: size),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.size,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InvestmentDisplayPage(title: investmentCards[index],)));
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
                          Text(
                            "\$12.3K",
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
                      "Food",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: const LinearProgressIndicator(
                      value: 0.6,
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

