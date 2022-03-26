import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25)
        )
      ),
      child: Center(
        child: ListTile(
          leading: const Icon(
            Icons.account_circle,
            size: 50,
          ),
          title: Text(
            "Hello Ankit!",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            "Welcome Back!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: const Icon(
            Icons.notifications
          ),
        ),
      ),
    );
  }
}