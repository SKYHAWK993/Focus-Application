import 'dart:io';
import 'package:flutter/material.dart';

class OverlayWidget extends StatelessWidget {
  final VoidCallback onProceed;
  final VoidCallback onCancel;

  OverlayWidget({required this.onProceed, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Warning: Timer is running!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Proceeding will reset the timer. Are you sure you want to continue?',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onProceed,
                    child: Text('Proceed'),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: onCancel,
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
