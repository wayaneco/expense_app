import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double percentageOfTotal;

  const Bar(this.label, this.spendAmount, this.percentageOfTotal);

  double get calculatePercentage {
    if (percentageOfTotal.isNaN) {
      return 0.0;
    }

    return percentageOfTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 60,
            width: 9,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              border: Border.all(width: 0.0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Container(
                  color: const Color.fromRGBO(220, 220, 220, 1),
                ),
                Tooltip(
                  verticalOffset: 25,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  message: '₱${spendAmount.toStringAsFixed(2)}',
                  triggerMode: TooltipTriggerMode.tap,
                  showDuration: const Duration(seconds: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: calculatePercentage,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(label)
        ],
      ),
    );
  }
}
