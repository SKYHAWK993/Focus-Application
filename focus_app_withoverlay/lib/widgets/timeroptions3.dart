import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../timerservice.dart';

// ignore: must_be_immutable
class timerOptions3 extends StatelessWidget {
  List selectableTimes3 = [
    "10",
    "300",
    "600",
    "900",
    "1200",
    "1500",
  ];

  timerOptions3({super.key});

  //double selectedTime = 1500;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes3.map((time) {
          return InkWell(
            onTap: () => provider.selectLongRest(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.longrest
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15))
                  : BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white30),
                      borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text((int.parse(time) ~/ 60).toString(),
                    style: int.parse(time) == provider.longrest
                        ? TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )
                        : const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
