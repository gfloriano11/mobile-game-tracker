import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/models/game.dart';

class Store extends StatelessWidget {
  final List<Game> games;

  const Store({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Loja',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF192B52),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Explore jogos para sua coleção.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF69748C)),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6FA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.storefront_outlined,
                          size: 48,
                          color: Color(0xFF69748C),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Catálogo em construção',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF192B52),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          games.isEmpty
                              ? 'Os jogos aparecerão aqui quando o catálogo estiver disponível.'
                              : 'Sua biblioteca possui ${games.length} jogos. '
                                    'Em breve, você poderá explorar jogos, '
                                    'preços e disponibilidade por aqui.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFF69748C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
