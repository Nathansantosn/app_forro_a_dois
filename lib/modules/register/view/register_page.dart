import 'package:appforro/modules/login/model/user_role.dart';
import 'package:appforro/modules/register/controller/register_controller.dart';
import 'package:appforro/modules/register/controller/repository/register_repository_imp.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:appforro/shared/widgets/custonbuttontext.dart';
import 'package:appforro/shared/widgets/custoninput.dart';
import 'package:appforro/shared/widgets/custonlabel.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Registertropage extends StatefulWidget {
  const Registertropage({super.key});

  @override
  State<Registertropage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registertropage> {
  late final RegisterController _controller;

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = RegisterController(
      RegisterRepository(Supabase.instance.client),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  Future<void> _onCadastrarPressed() async {
    final sucesso = await _controller.cadastrar(
      nome: _nomeController.text,
      email: _emailController.text,
      senha: _senhaController.text,
      confirmarSenha: _confirmarSenhaController.text,
    );

    if (sucesso && mounted) {
      Navigator.of(context).pop();
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
            flex: 3,
            child: Container(
              height: 110,
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
            flex: 17,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(28, 32, 28, 32),
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
                    CustonLabel(text: 'NOME'),
                    CustonInput(
                      hint: 'Seu nome completo',
                      controller: _nomeController,
                    ),

                    const SizedBox(height: 16),
                    CustonLabel(text: 'EMAIL'),
                    CustonInput(
                      hint: 'seu@gmail.com',
                      controller: _emailController,
                    ),

                    const SizedBox(height: 16),
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

                    const SizedBox(height: 16),
                    CustonLabel(text: 'CONFIRMAR SENHA'),
                    CustonInput(
                      hint: '123456',
                      controller: _confirmarSenhaController,
                      obscureText: true,
                      suffix: const Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),
                    CustonLabel(text: 'VOCÊ É'),
                    const SizedBox(height: 8),
                    ValueListenableBuilder<UserRole>(
                      valueListenable: _controller.selectedRole,
                      builder: (context, selecionado, _) {
                        return Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: UserRole.values.map((role) {
                            final isSelected = role == selecionado;
                            return ChoiceChip(
                              label: Text(role.label),
                              selected: isSelected,
                              onSelected: (_) =>
                                  _controller.selectedRole.value = role,
                              selectedColor: const Color(0xFFFF5C00),
                              backgroundColor: Colors.white10,
                              labelStyle: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                              side: BorderSide(
                                color: isSelected
                                    ? const Color(0xFFFF5C00)
                                    : Colors.white24,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),

                    const SizedBox(height: 12),
                    ValueListenableBuilder<String?>(
                      valueListenable: _controller.errorMessage,
                      builder: (context, erro, _) {
                        if (erro == null) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
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

                    ValueListenableBuilder<bool>(
                      valueListenable: _controller.isLoading,
                      builder: (context, isLoading, _) {
                        return SizedBox(
                          width: double.infinity,
                          child: CustonButton(
                            text: isLoading ? 'Cadastrando...' : 'Cadastrar',
                            borda: const BorderSide(
                              color: Color(0xFFFF5C00),
                              width: 2,
                            ),
                            textColor: const Color(0xFFFFFFFF),
                            onPressed: isLoading ? () {} : _onCadastrarPressed,
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
                            text: 'Já tem conta?',
                            onPressed: () {},
                            color: Colors.white,
                          ),

                          CustonButtonText(
                            text: 'Entrar',
                            onPressed: () => Navigator.of(context).pop(),
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
