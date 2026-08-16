import 'package:appforro/modules/home/view/homepage.dart';
import 'package:appforro/modules/login/controller/login_controller.dart';
import 'package:appforro/modules/login/controller/repository/login_repository.dart';
import 'package:appforro/modules/login/view/loginpage.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/core/routes/route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  late final LoginController _loginController;

  @override
  void initState() {
    super.initState();

    _loginController = LoginController(
      LoginRepository(Supabase.instance.client),
    );

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

    Future.delayed(const Duration(seconds: 4)).then((_) => _decidirDestino());
  }

  Future<void> _decidirDestino() async {
    final usuario = await _loginController.restoreSession();

    if (!mounted) return;

    if (usuario != null) {
      // Sessão salva e matrícula ativa: entra direto na Home.
      Navigator.of(context).pushReplacement(
        sliderRouteTransition(
          HomePege(currentUser: usuario),
          duration: const Duration(milliseconds: 2000),
          beginPosition: const Offset(0, 1),
        ),
      );
      return;
    }

    // Sem sessão salva, ou matrícula pending/cancelled: vai pro Login.
    // Se houver uma mensagem específica (ex: "cadastro em análise"),
    // ela é exibida assim que a tela de Login abrir.
    Navigator.of(context).pushReplacement(
      sliderRouteTransition(
        Loginpage(initialMessage: _loginController.errorMessage.value),
        duration: const Duration(milliseconds: 2000),
        beginPosition: const Offset(0, 1),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _loginController.dispose();
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
