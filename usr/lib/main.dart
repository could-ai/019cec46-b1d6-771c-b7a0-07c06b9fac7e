import 'package:flutter/material.dart';

void main() {
  runApp(const ComicApp());
}

class ComicApp extends StatelessWidget {
  const ComicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banda Desenhada - Luarmina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          brightness: Brightness.dark,
          surface: const Color(0xFF2C241B), // Dark sepia tone
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, height: 1.5, letterSpacing: 0.5),
          bodyMedium: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ComicReaderScreen(),
      },
    );
  }
}

class ComicPanel {
  final String id;
  final String text;
  final String? dialogue;
  final IconData placeholderIcon;

  ComicPanel({
    required this.id,
    required this.text,
    this.dialogue,
    required this.placeholderIcon,
  });
}

class ComicReaderScreen extends StatefulWidget {
  const ComicReaderScreen({super.key});

  @override
  State<ComicReaderScreen> createState() => _ComicReaderScreenState();
}

class _ComicReaderScreenState extends State<ComicReaderScreen> {
  // Dividindo o texto em "painéis" de banda desenhada
  final List<ComicPanel> panels = [
    ComicPanel(
      id: 'panel_1',
      text: 'Nessa altura, eu ainda pescava em longas viagens, semanas de ausência nos bancos de Sofala. Nem notava a existência de Luarmina.',
      placeholderIcon: Icons.sailing,
    ),
    ComicPanel(
      id: 'panel_2',
      text: 'Também ela, logo que desembarcou, se internou na Missão, em estágio para freira. Ficou enclausurada nessas penumbras onde se murmura conversa com Deus.',
      placeholderIcon: Icons.church,
    ),
    ComicPanel(
      id: 'panel_3',
      text: 'Só uns anos mais tarde ela saiu dessa reclusão. E se instalou na casa que os padres lhe destinaram, bem junto à minha morada. Luarmina costureirava — era seu sustento.',
      placeholderIcon: Icons.cut,
    ),
    ComicPanel(
      id: 'panel_4',
      text: 'O pai era um grego, pescador. A mãe morreu de desgosto, dizem que por causa da beleza da filha, que endoidava os homens. A senhora maldizia a perfeição de sua filha.',
      placeholderIcon: Icons.face_retouching_off,
    ),
    ComicPanel(
      id: 'panel_5',
      text: 'Só bem depois de me retirar das pescarias é que dei por mim a encostar desejos na vizinha. Comecei por cartas, mensagens à distância.',
      placeholderIcon: Icons.mail,
    ),
    ComicPanel(
      id: 'panel_6',
      text: 'À custa de minhas insistências namoradeiras, Luarmina já aprendera as mil defesas. Ela sempre me desfazia os favores, negando-se.',
      dialogue: '— Me deixa sossegada, Zeca. Não vê que eu já não desengomo lençol?\n— Que ideia, Dona vizinha?! Quem lhe disse que eu tinha essa intenção?',
      placeholderIcon: Icons.forum,
    ),
    ComicPanel(
      id: 'panel_7',
      text: 'As pernas dela, da maneira como incham, dificultam as vias do sangue. Lhe icebergam os pés, a gente toca e são blocos de gelo. Um dia, aproveitei para me oferecer:',
      dialogue: '— Quer que lhe aqueça os pés?\n— Me aquece, Zeca?\n— Sim, aqueço mas... pela parte de dentro.',
      placeholderIcon: Icons.ac_unit,
    ),
    ComicPanel(
      id: 'panel_8',
      text: 'Tentava um deslize na defesa dela. Mas levei tampa. Eu estava como essoutro que foi lavar a mão e sujou o sabão.',
      placeholderIcon: Icons.pan_tool,
    ),
    ComicPanel(
      id: 'panel_9',
      text: 'Mas é pena eu e a vizinha não nos simetricarmos. Porque ambos somos semiviúvos: nunca tivemos companheiro, mas esse parceiro, mesmo assim, desapareceu.',
      placeholderIcon: Icons.people_outline,
    ),
    ComicPanel(
      id: 'panel_10',
      text: 'Hoje sei como se mede a verdadeira idade: vamos ficando velhos quando não fazemos novos amigos. Estamos morrendo a partir do momento em que não mais nos apaixonamos.',
      placeholderIcon: Icons.favorite_border,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luarmina - Banda Desenhada', style: TextStyle(fontFamily: 'serif')),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        itemCount: panels.length,
        itemBuilder: (context, index) {
          final panel = panels[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: ComicPanelWidget(
              panel: panel,
              panelNumber: index + 1,
            ),
          );
        },
      ),
    );
  }
}

class ComicPanelWidget extends StatelessWidget {
  final ComicPanel panel;
  final int panelNumber;

  const ComicPanelWidget({
    super.key,
    required this.panel,
    required this.panelNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Área da Ilustração (Placeholder)
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        panel.placeholderIcon,
                        size: 64,
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Espaço para Ilustração $panelNumber',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '#$panelNumber',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Narração
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              left: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
            ),
          ),
          child: Text(
            panel.text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        
        // Balões de Diálogo (se houver)
        if (panel.dialogue != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(24).copyWith(
                topLeft: const Radius.circular(4),
              ),
            ),
            child: Text(
              panel.dialogue!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
