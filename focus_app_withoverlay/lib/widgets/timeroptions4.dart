import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../timerservice.dart';

// ignore: must_be_immutable
class timerOptions4 extends StatelessWidget {
  List selectableModes = ["ON", "OFF"];

  timerOptions4({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableModes.map((smode) {
          return InkWell(
            onTap: () => provider.selectMode(smode),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: smode == provider.mode
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15))
                  : BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white30),
                      borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(smode,
                    style: smode == provider.mode
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
