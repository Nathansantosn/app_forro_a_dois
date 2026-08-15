import 'package:appforro/modules/login/controller/forgot_password_controller.dart';
import 'package:appforro/modules/login/controller/repository/forgot_password_repository.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:appforro/shared/widgets/custoninput.dart';
import 'package:appforro/shared/widgets/custonlabel.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final ForgotPasswordController _controller;
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = ForgotPasswordController(
      ForgotPasswordRepository(Supabase.instance.client),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onSendPressed() async {
    await _controller.sendResetEmail(email: _emailController.text);
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
          const Expanded(
            flex: 4,
            child: Center(
              child: Icon(
                Icons.lock_reset_outlined,
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
                child: ValueListenableBuilder<bool>(
                  valueListenable: _controller.emailSent,
                  builder: (context, emailSent, _) {
                    if (emailSent) {
                      return _buildSuccessState();
                    }
                    return _buildFormState();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormState() {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recuperar senha',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Informe o e-mail cadastrado. Vamos enviar um link para você criar uma nova senha.',
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 16),
        CustonLabel(text: 'EMAIL'),
        CustonInput(hint: 'seu@gmail.com', controller: _emailController),

        ValueListenableBuilder<String?>(
          valueListenable: _controller.errorMessage,
          builder: (context, erro, _) {
            if (erro == null) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                erro,
                style: const TextStyle(color: Colors.redAccent, fontSize: 13),
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
                text: isLoading ? 'Enviando...' : 'Enviar link',
                borda: const BorderSide(color: Color(0xFFFF5C00), width: 2),
                textColor: const Color(0xFFFFFFFF),
                onPressed: isLoading ? () {} : _onSendPressed,
                color: const Color(0xFFFF5C00),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        Center(
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Voltar para o login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessState() {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.mark_email_read_outlined,
          color: Colors.green,
          size: 48,
        ),
        const Text(
          'E-mail enviado!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Se ${_emailController.text.trim()} estiver cadastrado, você vai receber um link para redefinir sua senha em instantes. Confira também a caixa de spam.',
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: CustonButton(
            text: 'Voltar para o login',
            borda: const BorderSide(color: Color(0xFFFF5C00), width: 2),
            textColor: const Color(0xFFFFFFFF),
            onPressed: () => Navigator.of(context).pop(),
            color: const Color(0xFFFF5C00),
          ),
        ),
      ],
    );
  }
}
