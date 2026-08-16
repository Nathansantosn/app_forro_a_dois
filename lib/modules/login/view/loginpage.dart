import 'package:appforro/modules/home/view/homepage.dart';
import 'package:appforro/modules/login/controller/login_controller.dart';
import 'package:appforro/modules/login/controller/repository/login_repository.dart';
import 'package:appforro/modules/register/view/register_page.dart';
import 'package:appforro/modules/reset_password/view/forgot_password_page.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:appforro/shared/widgets/custonbuttontext.dart';
import 'package:appforro/shared/widgets/custoninput.dart';
import 'package:appforro/shared/widgets/custonlabel.dart';
import 'package:appforro/core/routes/route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key, this.initialMessage});

  /// Mensagem opcional exibida assim que a tela abre — usada pela Splash
  /// pra avisar, por exemplo, que a matrícula está pendente ou foi
  /// cancelada quando ela tenta restaurar uma sessão salva.
  final String? initialMessage;

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late final LoginController _controller;
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = LoginController(LoginRepository(Supabase.instance.client));

    if (widget.initialMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(widget.initialMessage!)));
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    final sucesso = await _controller.login(
      email: _emailController.text,
      password: _senhaController.text,
    );

    if (sucesso && mounted) {
      Navigator.of(context).pushReplacement(
        sliderRouteTransition(
          HomePege(currentUser: _controller.currentUser),
          duration: const Duration(milliseconds: 2000),
          beginPosition: const Offset(0, 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5C00),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5C00),
        centerTitle: true,
        title: const Applogo(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(blurRadius: 15, offset: const Offset(0, 5)),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/boneco.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
                decoration: const BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustonLabel(text: 'EMAIL'),
                    CustonInput(
                      hint: 'seu@gmail.com',

                      controller: _emailController,
                    ),
                    const SizedBox(height: 24),
                    CustonLabel(text: 'SENHA'),
                    CustonInput(
                      hint: '123456',
                      controller: _senhaController,
                      obscureText: true,
                      suffix: const Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustonButtonText(
                        text: 'Esqueceu a senha?',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordPage(),
                            ),
                          );
                        },
                        color: Colors.white,
                      ),
                    ),

                    ValueListenableBuilder<String?>(
                      valueListenable: _controller.errorMessage,
                      builder: (context, erro, _) {
                        if (erro == null) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          child: Text(
                            erro,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 13,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                    ValueListenableBuilder<bool>(
                      valueListenable: _controller.isLoading,
                      builder: (context, isLoading, _) {
                        return SizedBox(
                          width: double.infinity,
                          child: CustonButton(
                            text: isLoading ? 'Entrando...' : 'Entrar',
                            borda: const BorderSide(
                              color: Color(0xFFFF5C00),
                              width: 2,
                            ),
                            textColor: const Color(0xFFFFFFFF),
                            onPressed: isLoading ? () {} : _onLoginPressed,
                            color: const Color(0xFFFF5C00),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustonButtonText(
                            text: 'Não possui conta?',
                            onPressed: () {},
                            color: Colors.white,
                          ),
                          CustonButtonText(
                            text: 'Cadastre-se',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const Registertropage(),
                                ),
                              );
                            },
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
