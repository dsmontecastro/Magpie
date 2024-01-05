import 'package:flutter/material.dart';
import 'package:magpie/extensions/int.dart';

import '../routes/page.dart';
import 'data.dart';

class CardSmall extends StatelessWidget {
  const CardSmall(this.data, {super.key});
  final Data data;

  Widget showGrowth(int past, int next) {
    double growth = (next - past) / past * 100;

    String ops = '+';
    String arrow = '↑';
    String graph = '⬈';
    Color color = Colors.green;

    if (past > next) {
      ops = '-';
      arrow = '↓';
      graph = '⬊';
      color = Colors.red;
    }

    return Column(
      children: [
        Text(
          graph,
          style: TextStyle(
            color: color,
            fontSize: 20,
          ),
        ),
        Text(
          '$arrow $ops ${growth.abs().toStringAsFixed(2)} %',
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget leading = SizedBox(
      width: 40,
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          data.logo,
          fit: BoxFit.fitHeight,
        ),
      ),
    );

    final Widget title = Text(
      data.name,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );

    final Widget subtitle = Text(
      data.code,
      style: const TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w600,
      ),
    );

    final Widget profit = Text(
      'Profit: ${data.profit23.toProfit()}',
      style: const TextStyle(
        fontSize: 11.0,
        fontWeight: FontWeight.w600,
      ),
    );

    return Container(
      constraints: const BoxConstraints(minHeight: 80),
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 15.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            minVerticalPadding: 0.0,
            horizontalTitleGap: 15.0,
            hoverColor: Colors.transparent,
            title: title,
            leading: leading,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [subtitle, profit],
            ),
            trailing: showGrowth(data.profit22, data.profit23),
            onTap: () {
              Navigator.pushNamed(
                context,
                DataPage.route,
                arguments: data,
              );
            },
          ),
        ),
      ),
    );
  }
}
