import 'package:flutter/cupertino.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Marketplace')),
      child: Center(child: Text('Hello World')),
    );
  }
}
