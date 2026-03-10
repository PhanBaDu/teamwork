import 'package:flutter/cupertino.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Menu')),
      child: Center(child: Text('Hello World')),
    );
  }
}
