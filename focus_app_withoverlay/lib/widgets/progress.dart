import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../timerservice.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return WillPopScope(
      onWillPop: () async {
        if (provider.isTimerRunning()) {
          // If the timer is running, prevent back button press
          return false;
        }
        // Allow back button press if the timer is not running
        return true;
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${provider.rounds}/4",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                "${provider.goal}/12",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'ROUND',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[200]),
              ),
              Text(
                'GOAL',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[200]),
              )
            ],
          )
        ],
      ),
    );
  }
}
