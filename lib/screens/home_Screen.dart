import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotificationService. showStartupNotification();
              
          },
          child: const Text('إشعار فوري'),
        ),
      ),
    );
  }
}