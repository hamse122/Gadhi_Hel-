import 'package:flutter/material.dart';
import '../main.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key, required this.onLogin, required this.onRegister});
  final VoidCallback onLogin;
  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('discover'),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Image.network(
              'https://i.postimg.cc/9fdkmVRT/Screenshot-2025-02-03-154505-Photoroom.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text('Discover Your DreamJob here', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            'Explore all the existing job roles based on your interest and study major',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700], height: 1.4),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GaadhiHelApp.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: onRegister,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

