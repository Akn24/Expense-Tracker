import 'package:expense_tracker/service/Database_service.dart';
import 'package:expense_tracker/widgets/homeappbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var vrishab = DatabaseService().categories();
    print(vrishab);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const HomeAppBar(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: size.width,
                    child: Card(
                      color: Colors.black,
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Balance",
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                          ),
                          Text(
                            "\$12,345",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
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
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: size.width * 0.315,
                            child: const Card(
                              elevation: 5,
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  "Send",
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
