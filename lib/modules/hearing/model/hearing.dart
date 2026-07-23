class Hearing {
  Hearing({
    required this.legenda,
    required this.name,
    required this.youtubeId,
    this.checked = false,
    required this.description,
  }) : code = DateTime.now().microsecondsSinceEpoch.toString();

  final String legenda;
  final String name;
  final String code;
  final String youtubeId;
  final String description;
  bool checked;
}

final List<Hearing> hearingYellow = [
  Hearing(
    legenda: '(SAB 1)',
    name: 'Girado simples + Basico lateral',
    youtubeId: 'yz567',
    description:
        'Giro simples C3 base da direita girando para esquerda. Complementando com um basico lateral C3',
  ),
  Hearing(
    legenda: '(SAB 2)',
    name: 'Girado inverso simples + Basico lateral',
    youtubeId: 'yz567',
    description:
        'Giro simples C3 base da esquerda girando para Direita. Complementando com um basico lateral C3',
  ),
];

final List<Hearing> hearingBlue = [
  Hearing(
    legenda: '(SAB 1)',
    name: 'Girado simples + Deslocamenteo caminhado rodado inverso',
    youtubeId: 'yz567',
    description:
        'Giro simples C3 base da direita girando para esquerda. Caminhada pisando com a esqueda em direção a esqueda com a inteção do corpo inclinado.',
  ),
  Hearing(
    legenda: '(SAB 2)',
    name: 'Inverso simples + Deslocamento caminhado rodado',
    youtubeId: 'yz567',
    description:
        'Giro simples C3 base da esqueda girando para direita. Caminhada pisando com a perna direita em direção a direita com a inteção do corpo inclinado.',
  ),
  Hearing(
    legenda: '(SAB 3)',
    name: 'Deslocamento rodado + Rotação ao redor do sparring de treino',
    youtubeId: 'yz567',
    description: 'Deslocamento rodado + Rotação ao redor do sparring de treino',
  ),
  Hearing(
    legenda: '(SAB 4)',
    name:
        'Deslocamento Rodado inverso + Rotação ao redor do sparring de treino',
    youtubeId: 'yz567',
    description:
        'Deslocamento Rodado inverso + Rotação ao redor do sparring de treino',
  ),
];

final List<Hearing> hearingRed = [
  Hearing(
    legenda: '(SAB 1)',
    name: 'Girado simples 360 + Básico lateral rodado',
    youtubeId: 'yz567',
    description:
        'Giro simples C3 base da direita girando para esquerda em 360. Complementando com um basico lateral C3.',
  ),
  Hearing(
    legenda: '(SAB 2)',
    name: 'Girado inverso simples em 360 + Basico lateral',
    youtubeId: 'yz567',
    description:
        'Giro simples C3 base da esquerda girando para Direita 360. Complementando com um basico lateral C3',
  ),
  Hearing(
    legenda: '(SAB 3)',
    name: 'Deslocamento rodado + Rotação rodada inversa + Rotação girada',
    youtubeId: 'yz567',
    description:
        'Deslocamento rodado + Rotação rodada inversa + Rotação girada',
  ),
  Hearing(
    legenda: '(SAB 4)',
    name:
        'Deslocamento Rodado inverso + Rotação rodada inversa + Rotação girada',
    youtubeId: 'yz567',
    description:
        'Deslocamento Rodado inverso + Rotação rodada inversa + Rotação girada',
  ),
];

final List<Hearing> hearingOrange = [
  Hearing(
    legenda: '(SAB 1)',
    name: 'Girado simples 360 + Deslocamente lateral rodado inverso',
    youtubeId: 'yz567',
    description: 'Girado simples 360 + Deslocamente lateral rodado inverso',
  ),
  Hearing(
    legenda: '(SAB 2)',
    name: 'Inverso simples 360 + Deslocamente lateral rodado',
    youtubeId: 'yz567',
    description: 'inverso simples 360 + Deslocamente lateral rodado',
  ),
  Hearing(
    legenda: '(SAB 3)',
    name: 'Girado simples 360 + Pisada neutra com técnica do paralelo canhoto',
    youtubeId: 'yz567',
    description:
        'Girado simples 360 + Pisada neutra com técnica do paralelo canhoto',
  ),
  Hearing(
    legenda: '(SAB 4)',
    name: 'Inverso simples 360 + Pisada neutra com técnica do paralelo destro',
    youtubeId: 'yz567',
    description:
        'inverso simples 360 + Pisada neutra com técnica do paralelo destro',
  ),
  Hearing(
    legenda: '(SAB 5)',
    name: 'Giradin em parabola + Deslocamento girado',
    youtubeId: 'yz567',
    description: 'Giradin em df d+ Deslocamento girado',
  ),
  Hearing(
    legenda: '(SAB 6)',
    name: 'Inversin em parabola + Deslocamento girado Inverso',
    youtubeId: 'yz567',
    description: 'Giradin em parabola + Deslocamento girado Inverso',
  ),
];
