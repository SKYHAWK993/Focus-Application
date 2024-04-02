import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'timerservice.dart';
import 'homescreen.dart';
import 'widgets/overlay_widget.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!await FlutterOverlayWindow.isPermissionGranted()) {
    FlutterOverlayWindow.requestPermission();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<timerservice>(
          create: (_) => timerservice(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyApp(),
          '/home': (context) => const homescreen(),
        },
      ),
    ),
  );
}

@pragma("vm:entry-point")
void overlayMain() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const OverlayScreen(),
  ));
}

class OverlayScreen extends StatelessWidget {
  const OverlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
      onProceed: () {
        FlutterOverlayWindow.closeOverlay();
        exit(0);
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }

  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homescreen(),
    );
  }
}
