import 'package:flutter/material.dart';

import '../data/card_large.dart';
import '../data/data.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  static const route = '/page';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Data;

    final AppBar appBar = AppBar(
      leadingWidth: 100,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp, size: 20),
              padding: const EdgeInsets.symmetric(horizontal: 3),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              'Back',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 14.0,
          right: 14.0,
        ),
        child: CardLarge(data),
      ),
    );
  }
}
