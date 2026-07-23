class DanceStep {
  DanceStep({
    required this.legenda,
    required this.name,
    this.checked = false,
    required this.youtubeId,
    required this.description,
  }) : code = DateTime.now().microsecondsSinceEpoch.toString();

  bool checked;
  final String legenda;
  final String name;
  final String code;
  final String youtubeId;
  final String description;
}

final List<DanceStep> danceStepYellow = [
  DanceStep(
    legenda: '(BE - 1c3)',
    name: 'Esmeril swingado',
    youtubeId: 'yz567',
    description:
        'O "Esmeril swingado" combina balanço e giros rápidos. Mantenha os joelhos flexionados para dar leveza ao movimento enquanto balança para os lados no ritmo da música.',
  ),
  DanceStep(
    legenda: '(PG-POG /BE - 2c3)',
    name: 'Girado Enrolado',
    youtubeId: 'abc890',
    description:
        'No "Enrolado", os braços dos parceiros se entrelaçam suavemente em movimentos circulares. A execução requer atenção na postura para não perder o equilíbrio durante o desenrolar do movimento.',
  ),

  DanceStep(
    legenda: '(BD-1C3)',
    name: 'Piões',
    youtubeId: 'jkl789',
    description:
        'O "Pião" é um giro completo onde o corpo deve permanecer alinhado. Utilize a base dos pés para girar de forma controlada e suave. e existem Pião Girado, Pião Girado inverso, Pião Rodado, Pião Rodado inverso',
  ),
  DanceStep(
    legenda: '(PG-POG /BE - 2c3)',
    name: 'Girado Gangorra',
    youtubeId: 'mno012',
    description:
        'A "Gangorra" envolve balanços para frente e para trás. A movimentação precisa ser fluida, imitando o movimento de um balanço.',
  ),
  DanceStep(
    legenda: '(BD - 1.2.3)',
    name: 'Esmeril tábua',
    youtubeId: 'pqr345',
    description:
        'O "Esmeril tábua" combina balanço do corpo. Mantenha os joelhos sepadatos com o do parceiro enquanto balança do corpo é sentido no braço com ele esticado sentindo o ritmo da música.',
  ),
  DanceStep(
    legenda: '(BE - 1c3)',
    name: 'Rodada',
    youtubeId: 'stu678',
    description:
        'A "Rodadinha" é um passo circular suave onde o parceiro conduz a parceira em um giro completo. Comece segurando as mãos em posição fechada e gire da direita para direita, mantendo os pés próximos ao solo para um movimento fluido e contínuo.',
  ),
  DanceStep(
    legenda: '(PG/BD-1c3)',
    name: 'Rodado',
    youtubeId: 'stu678',
    description:
        'A "Rodadinha" é um passo circular suave onde o parceiro conduz a parceira em um giro completo. Comece segurando as mãos em posição fechada e gire da esquieda para esquerda, mantendo os pés próximos ao solo para um movimento fluido e contínuo.',
  ),
];

final List<DanceStep> danceStepBlue = [
  DanceStep(
    legenda: '(PGT/BE - 02c3)',
    name: 'Giradin',
    youtubeId: 'la3sijkQJ7Y',
    description:
        'A "Giradin" é um passo circular suave onde o parceiro conduz a parceira em um giro completo. Comece segurando as mãos em posição fechada e gire no sentido horário, mantendo os pés próximos ao solo para um movimento fluido e contínuo.',
  ),
  DanceStep(
    legenda: '(PGT/BE - 02c3)',
    name: 'Rosca',
    youtubeId: 'def456',
    description:
        'O passo "Rosca" envolve um movimento em espiral. O líder guia a parceira em um giro estreito, criando um efeito visual de torção. Use a troca de mãos alternadas para adicionar complexidade e ritmo ao movimento.',
  ),
  DanceStep(
    legenda: '(PG/BD - 1c5)',
    name: 'Giradin Moldurável ',
    youtubeId: 'ghi789',
    description:
        'No "Moldurável", os dançarinos mantêm uma postura elegante enquanto criam formas com os braços. Inicie com um movimento lateral e leve os braços para formar um quadro ao redor dos corpos, destacando o estilo visual.',
  ),
  DanceStep(
    legenda: '(PCMP/BE - 02c3)',
    name: 'Pião girado',
    youtubeId: 'jkl012',
    description:
        'O "Pião Oposto" requer um giro rápido em direção contrária ao movimento inicial. Comece com um impulso suave e mantenha a base dos pés firmes para evitar perda de equilíbrio durante a rotação.',
  ),
  DanceStep(
    legenda: '(PG/BD - 1c5)',
    name: 'Inversin solto',
    youtubeId: 'mno345',
    description:
        'Nesse passo, há uma inversão de posições com movimentos livres. Inicie com um giro básico e, em seguida, alterne as posições soltando as mãos para criar um efeito dinâmico.',
  ),
  DanceStep(
    legenda: '(BE - 1c3)',
    name: 'Push pull',
    youtubeId: 'pqr678',
    description:
        'O "Push pull" consiste em um jogo de empurrar e puxar controlado. O líder aplica uma leve pressão para empurrar o parceiro e depois puxa suavemente para trazê-lo de volta, mantendo a fluidez.',
  ),
  DanceStep(
    legenda: '(PCTA/BD - 1c5)',
    name: 'Inverson com abraço trocado',
    youtubeId: 'stu901',
    description:
        'Nesse passo, há uma inversão de posições com movimentos livres. Inicie com um giro básico e, em seguida, alterne as posições sem soltar as mãos para criar um efeito dinâmico.',
  ),
  DanceStep(
    legenda: '(PG/BD - 1c5)',
    name: 'Inverson com Ambidestro',
    youtubeId: 'vwx234',
    description:
        'Essa variação envolve inversões com troca de mãos. O líder utiliza as duas mãos alternadamente para guiar os giros e alternâncias, destacando a coordenação e o controle.',
  ),
  DanceStep(
    legenda: '(CA)',
    name: 'Esmeril aberto',
    youtubeId: 'pqr345',
    description:
        'O "Esmeril aberto" combina balanço do corpo. Mantenha os braços abertos enquanto balança do corpo é sentido no braço com ele esticado sentindo o ritmo da música.',
  ),

  DanceStep(
    legenda: '(CA)',
    name: 'Esmeril tábua',
    youtubeId: 'pqr345',
    description:
        'O "Esmeril tábua" combina balanço do corpo. Mantenha os joelhos sepadatos com o do parceiro enquanto balança do corpo é sentido no braço com ele esticado sentindo o ritmo da música.',
  ),
  DanceStep(
    legenda: '(CA)',
    name: 'Esmeril swingado',
    youtubeId: 'yz567',
    description:
        'O "Esmeril swingado" combina balanço e giros rápidos. Mantenha os joelhos flexionados para dar leveza ao movimento enquanto balança para os lados no ritmo da música.',
  ),
];

final List<DanceStep> danceStepRed = [
  DanceStep(
    legenda: '(PG/ BD -02c3)',
    name: 'Girado com movimento coordenado',
    youtubeId: 'vwx901',
    description:
        'Passo coordenado com transições precisas, exigindo sincronia entre os parceiros para manter o ritmo e a estética do movimento.',
  ),
  DanceStep(
    legenda: '(PS/BE - 01c3)',
    name: 'Sacada coice',
    youtubeId: 'yz234',
    description:
        'Movimento ágil que simula um chute controlado, perfeito para transições rápidas e dinâmicas no ritmo da música.',
  ),
  DanceStep(
    legenda: '(PS/BE - 01c3)',
    name: 'Skip',
    youtubeId: 'abc567',
    description:
        'Pequenos saltos contínuos, proporcionando leveza e um ritmo acelerado, ideais para danças mais vibrantes e animadas.',
  ),
  DanceStep(
    legenda: '(CE)',
    name: 'Sacada Multipla',
    youtubeId: 'def890',
    description:
        'Sequência de sacadas consecutivas que criam um efeito visual fluido e envolvente, elevando a complexidade coreográfica.',
  ),
  DanceStep(
    legenda: '(BD - 01c7)',
    name: 'Auxiliadin',
    youtubeId: 'ghi123',
    description:
        'Movimento de suporte que facilita a condução do parceiro durante transições complexas, oferecendo estabilidade e harmonia.',
  ),
  DanceStep(
    legenda: '(PGT /BD - 01c3)',
    name: 'Girado Unigangorrosca',
    youtubeId: 'jkl456',
    description:
        'Passo combinado que inclui giros e finalizações circulares, criando um efeito dinâmico e estético na dança.',
  ),
  DanceStep(
    legenda: '(PG/BD - 1c5)',
    name: 'Inversin pipa',
    youtubeId: 'mno789',
    description:
        'Movimento leve e fluido que imita o voo de uma pipa, trazendo suavidade e elegância para a coreografia.',
  ),
];

final List<DanceStep> danceStepOrange = [
  DanceStep(
    legenda: '(PG/PD - 01c5)',
    name: 'Esticado',
    youtubeId: 'pqr012',
    description:
        'Movimento alongado que destaca a extensão máxima do corpo, realçando a postura e a expressividade dos dançarinos.',
  ),
  DanceStep(
    legenda: '(POG* /BD - 01c3.01c5)',
    name: 'Skip Duplo',
    youtubeId: 'stu345',
    description:
        'Dois saltos rápidos e consecutivos, com ritmo bem definido, adicionando dinamismo e vibração à performance.',
  ),
  DanceStep(
    legenda: '(PGD/BE.BD - 01c3. 01c7)',
    name: 'Enroladão costas',
    youtubeId: 'vwx678',
    description:
        'Grande enrolamento para frente que envolve os dois parceiros em uma conexão visual e física impressionante.',
  ),
  DanceStep(
    legenda: '(PGIT/BE.BD - 01c5. 01c3. 01c3)',
    name: 'Enroladão Frente',
    youtubeId: 'vwx678',
    description:
        'Grande enrolamento para frente que envolve os dois parceiros em uma conexão visual e física impressionante.',
  ),
  DanceStep(
    legenda: '(BD 01c3)',
    name: 'Flic-flac Salto',
    youtubeId: 'yz901',
    description:
        'Salto acrobático que combina ida e volta em um movimento fluido, ideal para performances energéticas e impactantes.',
  ),
  DanceStep(
    legenda: '(BD 01c3)',
    name: 'Cadena',
    youtubeId: 'abc234',
    description:
        'Sequência contínua de movimentos encadeados que criam um fluxo elegante e natural na dança.',
  ),
  DanceStep(
    legenda: '(PG/BD - 1c3. 1c5)',
    name: 'Gangorra Circular/Angular',
    youtubeId: 'def567',
    description:
        'Movimento oscilante que pode ser executado em formatos circular ou angular, adicionando versatilidade e fluidez à coreografia.',
  ),
  DanceStep(
    legenda: '(PGT/BD - 1c5)',
    name: 'Inversin Destro Costas',
    youtubeId: 'ghi890',
    description:
        'Inversão realizada de costas, exigindo precisão e sincronia para manter a harmonia do passo.',
  ),
  DanceStep(
    legenda: '(BE - 1c5 / BD - 1c5)',
    name: 'Fricção frente/Fricção costas',
    youtubeId: 'jkl123',
    description:
        'Movimento alternado entre frente e costas, criando contraste visual e variação dinâmica na execução.',
  ),
  DanceStep(
    legenda: '(CE) ( 1.)',
    name: 'Catada Gancho',
    youtubeId: 'mno456',
    description:
        'Passo em formato de gancho, projetado para capturas rápidas e conexões ágeis entre os parceiros.',
  ),
  DanceStep(
    legenda: '(PG/ BD - 01c7)',
    name: 'Auxiliadin Preso',
    youtubeId: 'pqr789',
    description:
        'Movimento de suporte fixo que oferece controle rígido e estabilidade ao parceiro durante transições exigentes.',
  ),

  DanceStep(
    legenda: '(BE - 01c3)',
    name: 'Baloné',
    youtubeId: 'def567',
    description:
        'Movimento depois de uma sacada em forma de arco para a conduzida ir ao lado.',
  ),
  DanceStep(
    legenda: '(PG/BD - 01c9)',
    name: 'Auxiliadão',
    youtubeId: 'ghi123',
    description:
        'Movimento de suporte que facilita a condução do parceiro durante transições complexas, oferecendo estabilidade e harmonia.',
  ),
  DanceStep(
    legenda: ' (PGD/ BD 01c7)',
    name: 'Inversin Destro/canhoto com transformação em ambidestro cruzado',
    youtubeId: 'mno789',
    description:
        'Movimento leve e fluifo, trazendo suavidade e elegância para a coreografia com trasformação.',
  ),
  DanceStep(
    legenda: ' (CE)',
    name: 'Saída em meia-lua',
    youtubeId: 'mno789',
    description: 'Movimento leve e fluifo.',
  ),
];
