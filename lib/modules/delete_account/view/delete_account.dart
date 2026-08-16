import 'package:appforro/modules/delete_account/controller/delete_account_controller.dart';
import 'package:appforro/modules/delete_account/controller/repository/delete_account_repository_imp.dart';
import 'package:appforro/modules/login/view/loginpage.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  late final DeleteAccountController _controller;
  bool _confirmado = false;

  @override
  void initState() {
    super.initState();
    _controller = DeleteAccountController(
      DeleteAccountRepository(Supabase.instance.client),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onDeletarPressed() async {
    await _controller.deleteAccount();

    if (_controller.success.value && mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const Loginpage()),
        (route) => false,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Sua conta foi deletada.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5C00),
        title: const Text('Deletar conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 48,
            ),
            const Text(
              'Essa ação é permanente',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Ao deletar sua conta, seu cadastro, progresso nas graduações e '
              'todos os seus dados serão removidos permanentemente. Isso não '
              'pode ser desfeito.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.red,
              value: _confirmado,
              onChanged: (v) => setState(() => _confirmado = v ?? false),
              title: const Text(
                'Entendo que essa ação é permanente e não pode ser desfeita.',
                style: TextStyle(color: Colors.white),
              ),
            ),

            ValueListenableBuilder<String?>(
              valueListenable: _controller.errorMessage,
              builder: (context, erro, _) {
                if (erro == null) return const SizedBox.shrink();
                return Text(
                  erro,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 13),
                );
              },
            ),

            ValueListenableBuilder<bool>(
              valueListenable: _controller.isLoading,
              builder: (context, isLoading, _) {
                return SizedBox(
                  width: double.infinity,
                  child: CustonButton(
                    text: isLoading ? 'Deletando...' : 'Deletar minha conta',
                    borda: const BorderSide(color: Colors.red, width: 2),
                    textColor: Colors.white,
                    onPressed: (isLoading || !_confirmado)
                        ? () {}
                        : _onDeletarPressed,
                    color: _confirmado
                        ? Colors.red
                        : Colors.red.withOpacity(0.3),
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
