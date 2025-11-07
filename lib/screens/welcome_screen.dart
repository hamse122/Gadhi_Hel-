import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/title_block.dart';

class WelcomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('welcome'),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        const TitleBlock(),
        const SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa vel, consequuntur sapiente at aspernatur temporibus, culpa quis nobis corrupti vero molestias.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700], height: 1.4),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onGetStarted,
            style: ElevatedButton.styleFrom(
              backgroundColor: GaadhiHelApp.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Get Started'),
          ),
        ),
      ],
    );
  }
}

