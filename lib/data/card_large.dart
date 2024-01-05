import 'package:flutter/material.dart';
import 'package:magpie/extensions/int.dart';

import 'data.dart';

class CardLarge extends StatelessWidget {
  const CardLarge(this.data, {super.key});
  final Data data;

  @override
  Widget build(BuildContext context) {
    Widget logo = SizedBox(
      width: 85,
      height: 85,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          data.logo,
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget title = Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        data.name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Widget subtitle = Text(
      data.code,
      style: const TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
      ),
    );

    return SizedBox(
      height: 270,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 17,
          ),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Row(
                  children: [
                    logo,
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 17.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title,
                            subtitle,
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 11.0),
                      child: Text(
                        'Profits:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Profit('2023', data.profit23),
                    const SizedBox(height: 7.0),
                    Profit('2022', data.profit22),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profit extends StatelessWidget {
  const Profit(this.year, this.amount, {super.key});
  final String year;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$year:',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 25),
        Text(
          amount.toProfit(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
