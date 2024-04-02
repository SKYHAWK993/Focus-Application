import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'timerservice.dart';
import 'widgets/timercard.dart';
import 'widgets/timercontroller.dart';
import 'widgets/progress.dart';
import 'widgets/timeroptions.dart';
import 'widgets/timeroptions2.dart';
import 'widgets/timeroptions3.dart';
import 'widgets/timeroptions4.dart';
import 'widgets/overlay_widget.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> with WidgetsBindingObserver {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    final provider = Provider.of<timerservice>(context, listen: false);
    if (provider.mode == "ON" && provider.isTimerRunning()) {
      if (state == AppLifecycleState.resumed) {
        await FlutterOverlayWindow.closeOverlay();
      } else {
        await FlutterOverlayWindow.showOverlay();
      }
    }
  }

  Color renderColor(String currentState) {
    if (currentState == "FOCUS") {
      return Colors.redAccent;
    } else {
      return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return WillPopScope(
      onWillPop: () async {
        if (provider.isTimerRunning()) {
          return await showDialog(
            context: context,
            builder: (context) => OverlayWidget(
              onProceed: () {
                provider.reset();
                Navigator.of(context).pop(true);
              },
              onCancel: () => Navigator.of(context).pop(false),
            ),
          );
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: currentIndex == 0
            ? renderColor(provider.currentState)
            : Colors.teal,
        appBar: currentIndex == 0
            ? AppBar(
          title: const Text('Pomodoro',
              style: TextStyle(
                color: Colors.white,
              )),
          backgroundColor: renderColor(provider.currentState),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              iconSize: 40,
              color: Colors.white,
              onPressed: () =>
                  Provider.of<timerservice>(context, listen: false)
                      .reset(),
            ),
          ],
        )
            : AppBar(
            title: const Text('Settings',
                style: TextStyle(
                  color: Colors.white,
                )),
            backgroundColor: Colors.teal),
        body: SingleChildScrollView(
          child: currentIndex == 0
              ? Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const TimerCard(),
                const SizedBox(
                  height: 80,
                ),
                if (!(provider.mode == "ON" && provider.isTimerRunning()))
                  timeController(),
                const SizedBox(
                  height: 40,
                ),
                const Progress()
              ],
            ),
          )
              : Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text('Focus Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    )),
                const SizedBox(height: 20),
                timerOptions(),
                const SizedBox(height: 20),
                Text('Rest Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    )),
                const SizedBox(height: 20),
                timerOptions2(),
                const SizedBox(height: 20),
                Text('Long Rest Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    )),
                const SizedBox(height: 20),
                timerOptions3(),
                const SizedBox(height: 20),
                Text('Focus Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    )),
                const SizedBox(height: 20),
                timerOptions4(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            )
          ],
          currentIndex: currentIndex,
          onTap: (int index) async {
            if (index == 1 && provider.isTimerRunning()) {
              await showDialog(
                context: context,
                builder: (context) => OverlayWidget(
                  onProceed: () {
                    provider.reset();
                    Navigator.of(context).pop();
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  onCancel: () => Navigator.of(context).pop(),
                ),
              );
            } else {
              setState(() {
                currentIndex = index;
              });
            }
          },
        ),
      ),
    );
  }
}
