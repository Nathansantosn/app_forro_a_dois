import 'package:appforro/modules/approval/controller/approval_controller.dart';
import 'package:appforro/modules/approval/controller/repository/approval_repository_imp.dart';
import 'package:appforro/modules/approval/model/pending_user_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApprovalPage extends StatefulWidget {
  const ApprovalPage({super.key});

  @override
  State<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  late final ApprovalController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ApprovalController(
      ApprovalRepository(Supabase.instance.client),
    );
    _controller.carregar();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _confirmarRecusa(PendingUserModel user) async {
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF181818),
        title: const Text(
          'Recusar cadastro?',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'O acesso de ${user.nome} (${user.email}) será bloqueado.',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Recusar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmou == true) {
      await _controller.recusar(user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5C00),
        title: const Text('Matrículas pendentes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _controller.carregar,
          ),
        ],
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: _controller.isLoading,
        builder: (context, isLoading, _) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFFF5C00)),
            );
          }

          return ValueListenableBuilder<String?>(
            valueListenable: _controller.errorMessage,
            builder: (context, erro, _) {
              if (erro != null) {
                return Center(
                  child: Text(erro, style: const TextStyle(color: Colors.red)),
                );
              }

              return ValueListenableBuilder<List<PendingUserModel>>(
                valueListenable: _controller.pendingUsers,
                builder: (context, users, _) {
                  if (users.isEmpty) {
                    return const Center(
                      child: Text(
                        'Nenhum cadastro pendente no momento.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: _controller.carregar,
                    color: const Color(0xFFFF5C00),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: users.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF242424),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.nome,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.email,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                user.role.label,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                      onPressed: () => _confirmarRecusa(user),
                                      child: const Text(
                                        'Recusar',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFFF5C00,
                                        ),
                                      ),
                                      onPressed: () =>
                                          _controller.aprovar(user.id),
                                      child: const Text('Aprovar'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
