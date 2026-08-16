import 'package:appforro/modules/change_password/controller/change_password_controller.dart';
import 'package:appforro/modules/change_password/controller/repository/change_password_repository_imp.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:appforro/shared/widgets/custoninput.dart';
import 'package:appforro/shared/widgets/custonlabel.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final ChangePasswordController _controller;
  final _senhaAtualController = TextEditingController();
  final _novaSenhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = ChangePasswordController(
      ChangePasswordRepository(Supabase.instance.client),
    );
    _controller.success.addListener(_onSuccess);
  }

  void _onSuccess() {
    if (_controller.success.value && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senha atualizada com sucesso!')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _controller.success.removeListener(_onSuccess);
    _controller.dispose();
    _senhaAtualController.dispose();
    _novaSenhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  Future<void> _onSalvarPressed() async {
    await _controller.changePassword(
      currentPassword: _senhaAtualController.text,
      newPassword: _novaSenhaController.text,
      confirmPassword: _confirmarSenhaController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5C00),
        title: const Text('Trocar senha'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustonLabel(text: 'SENHA ATUAL'),
            CustonInput(
              hint: '••••••',
              controller: _senhaAtualController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustonLabel(text: 'NOVA SENHA'),
            CustonInput(
              hint: '••••••',
              controller: _novaSenhaController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustonLabel(text: 'CONFIRMAR NOVA SENHA'),
            CustonInput(
              hint: '••••••',
              controller: _confirmarSenhaController,
              obscureText: true,
            ),

            ValueListenableBuilder<String?>(
              valueListenable: _controller.errorMessage,
              builder: (context, erro, _) {
                if (erro == null) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
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

            const SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.isLoading,
              builder: (context, isLoading, _) {
                return SizedBox(
                  width: double.infinity,
                  child: CustonButton(
                    text: isLoading ? 'Salvando...' : 'Salvar nova senha',
                    borda: const BorderSide(color: Color(0xFFFF5C00), width: 2),
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
    );
  }
}
