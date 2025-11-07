import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/social_login_row.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.onToLogin});
  final VoidCallback onToLogin;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('register'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text('Create Account', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('Create an account so you can explore all the existing jobs', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
          const SizedBox(height: 16),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: confirmController,
                  decoration: const InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : (v != passwordController.text ? 'Passwords do not match' : null),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(value: agree, onChanged: (v){ setState(()=> agree = v ?? false); }),
                    const Expanded(
                      child: Text('By signing up, you are agreeing to the Privacy and Terms of Service'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!agree) return;
                      if (formKey.currentState?.validate() ?? false) {
                        debugPrint('Registration submitted: '+emailController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GaadhiHelApp.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Sign up'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: widget.onToLogin,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Already have an account'),
                  ),
                ),
                const SizedBox(height: 16),
                const SocialLoginRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

