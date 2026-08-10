import 'package:appforro/modules/home/view/homepage.dart';
import 'package:appforro/modules/login/view/loginpage.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/routes/route_transitions.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();

    Future.delayed(const Duration(seconds: 4)).then(
      (_) => Navigator.of(context).pushReplacement(
        sliderRouteTransition(
          const Loginpage(),
          duration: Duration(milliseconds: 2000),
          beginPosition: Offset(0, 1),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5C00),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/boneco.jpg',
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Ensinamos Forró para todos',
                  style: AppTextStyles.title(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
