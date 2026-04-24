import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IronPulseSplash extends StatefulWidget {
  const IronPulseSplash({super.key});

  @override
  State<IronPulseSplash> createState() => _IronPulseSplashState();
}

class _IronPulseSplashState extends State<IronPulseSplash>
    with TickerProviderStateMixin {
  late AnimationController _contentController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeIn,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _contentController,
            curve: Curves.easeOutBack,
          ),
        );

    // بدء حركة الدخول
    _contentController.forward();

    // الانتقال بعد 4 ثوانٍ
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 4));

    // تأكد أن الـ Widget ما زال موجوداً في الـ Tree قبل بدء حركة الخروج
    if (!mounted) return;

    // تنفيذ حركة الخروج (Reverse)
    await _contentController.reverse();

    // استخدام GoRouter بشكل صحيح للانتقال
    // go() تقوم باستبدال الصفحة الحالية (مثل pushReplacement) وهو الأفضل للـ Splash
    if (mounted) {
      context.go("/login");
    }
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121821),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash/splash image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLogo(),
                    const SizedBox(height: 30),
                    _buildBrandName(),
                    const SizedBox(height: 10),
                    const Text(
                      'FEEL THE ENERGY',
                      style: TextStyle(color: Colors.grey, letterSpacing: 4),
                    ),
                    const SizedBox(height: 40),
                    _buildProgressBar(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Widgets Components ---

  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1A222D),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3), width: 2),
      ),
      child: const Icon(Icons.fitness_center, color: Colors.white, size: 40),
    );
  }

  Widget _buildBrandName() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
        children: [
          TextSpan(
            text: 'IRON',
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: 'PULSE',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: LinearProgressIndicator(
        backgroundColor: Color(0xFF222B38),
        color: Colors.blue,
      ),
    );
  }
}
