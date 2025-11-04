import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_button.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Or continue with'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SocialButton(icon: FontAwesomeIcons.google),
            SizedBox(width: 12),
            SocialButton(icon: FontAwesomeIcons.facebook),
            SizedBox(width: 12),
            SocialButton(icon: FontAwesomeIcons.apple),
          ],
        ),
      ],
    );
  }
}

