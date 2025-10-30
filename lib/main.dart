import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const GaadhiHelApp());
}

class GaadhiHelApp extends StatelessWidget {
  const GaadhiHelApp({super.key});

  static const Color primaryColor = Color(0xFF8B1E7C);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaadhi Hel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const HomeShell(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum AppScreen { welcome, discover, login, register }

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  AppScreen current = AppScreen.welcome;
  int navIndex = 0;

  void showScreen(AppScreen screen) {
    setState(() {
      current = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _buildScreen(context),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _BottomNav(
        currentIndex: navIndex,
        onTap: (i) => setState(() => navIndex = i),
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    switch (current) {
      case AppScreen.welcome:
        return _WelcomeScreen(onGetStarted: () => showScreen(AppScreen.discover));
      case AppScreen.discover:
        return _DiscoverScreen(
          onLogin: () => showScreen(AppScreen.login),
          onRegister: () => showScreen(AppScreen.register),
        );
      case AppScreen.login:
        return _LoginScreen(
          onToRegister: () => showScreen(AppScreen.register),
        );
      case AppScreen.register:
        return _RegisterScreen(
          onToLogin: () => showScreen(AppScreen.login),
        );
    }
  }
}

class _WelcomeScreen extends StatelessWidget {
  const _WelcomeScreen({required this.onGetStarted});
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('welcome'),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        _TitleBlock(),
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

class _TitleBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome TO',
          style: GoogleFonts.bebasNeue(
            textStyle: const TextStyle(fontSize: 45),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Gaadhi Hel.',
          style: GoogleFonts.pompiere(
            textStyle: const TextStyle(fontSize: 50),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _DiscoverScreen extends StatelessWidget {
  const _DiscoverScreen({required this.onLogin, required this.onRegister});
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

class _LoginScreen extends StatefulWidget {
  const _LoginScreen({required this.onToRegister});
  final VoidCallback onToRegister;

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('login'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text('Login here', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('Welcome back you\'ve been missed!', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
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
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot your password?', style: TextStyle(color: GaadhiHelApp.primaryColor)),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        debugPrint('Login submitted: '+emailController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GaadhiHelApp.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Sign in'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: widget.onToRegister,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Create new account'),
                  ),
                ),
                const SizedBox(height: 16),
                _SocialLoginRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterScreen extends StatefulWidget {
  const _RegisterScreen({required this.onToLogin});
  final VoidCallback onToLogin;

  @override
  State<_RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<_RegisterScreen> {
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
                _SocialLoginRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLoginRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Or continue with'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _SocialButton(icon: FontAwesomeIcons.google),
            SizedBox(width: 12),
            _SocialButton(icon: FontAwesomeIcons.facebook),
            SizedBox(width: 12),
            _SocialButton(icon: FontAwesomeIcons.apple),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(child: FaIcon(icon, color: Colors.black87)),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: Colors.white,
      indicatorColor: GaadhiHelApp.primaryColor.withOpacity(0.08),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.comment_outlined), selectedIcon: Icon(Icons.comment), label: 'About'),
        NavigationDestination(icon: Icon(Icons.place_outlined), selectedIcon: Icon(Icons.place), label: 'Map'),
        NavigationDestination(icon: Icon(Icons.directions_car_outlined), selectedIcon: Icon(Icons.directions_car), label: 'Find ride'),
        NavigationDestination(icon: Icon(Icons.contact_page_outlined), selectedIcon: Icon(Icons.contact_page), label: 'Contact'),
      ],
    );
  }
}
