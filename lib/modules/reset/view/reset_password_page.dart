import 'package:appforro/modules/home/view/homepage.dart';
import 'package:appforro/modules/reset/controller/reset_password_controller.dart';
import 'package:appforro/modules/reset/controller/repository/reset_password_repository_imp.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:appforro/shared/widgets/custoninput.dart';
import 'package:appforro/shared/widgets/custonlabel.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final ResetPasswordController _controller;
  final _novaSenhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = ResetPasswordController(
      ResetPasswordRepository(Supabase.instance.client),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _novaSenhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  Future<void> _onSalvarPressed() async {
    final sucesso = await _controller.updatePassword(
      newPassword: _novaSenhaController.text,
      confirmPassword: _confirmarSenhaController.text,
    );

    if (sucesso && mounted) {
      // Depois de trocar a senha, a sessão de recovery já está ativa,
      // então manda direto pra Home em vez de voltar pro login.
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomePege()),
        (route) => false,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senha atualizada com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Impede voltar pro estado de "link de recovery aberto" sem definir senha.
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFFF5C00),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF5C00),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Applogo(),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 4,
              child: Center(
                child: Icon(
                  Icons.lock_open_outlined,
                  color: Colors.white,
                  size: 90,
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
                      const Text(
                        'Defina sua nova senha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustonLabel(text: 'NOVA SENHA'),
                      CustonInput(
                        hint: '123456',
                        controller: _novaSenhaController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      CustonLabel(text: 'CONFIRMAR SENHA'),
                      CustonInput(
                        hint: '123456',
                        controller: _confirmarSenhaController,
                        obscureText: true,
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

                      const SizedBox(height: 16),
                      ValueListenableBuilder<bool>(
                        valueListenable: _controller.isLoading,
                        builder: (context, isLoading, _) {
                          return SizedBox(
                            width: double.infinity,
                            child: CustonButton(
                              text: isLoading
                                  ? 'Salvando...'
                                  : 'Salvar nova senha',
                              borda: const BorderSide(
                                color: Color(0xFFFF5C00),
                                width: 2,
                              ),
                              textColor: const Color(0xFFFFFFFF),
                              onPressed: isLoading ? () {} : _onSalvarPressed,
                              color: const Color(0xFFFF5C00),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
