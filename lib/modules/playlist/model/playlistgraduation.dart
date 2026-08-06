import 'dart:ui';

import 'package:flutter/material.dart';

class PlaylistGraduation {
  final String nome;
  final Color color;
  final String url;

  PlaylistGraduation({
    required this.nome,
    required this.color,
    required this.url,
  });
}

final playlists = [
  PlaylistGraduation(
    nome: 'Amarela',
    color: Colors.yellow,
    url: '0h969YYkfU9sgyw1z8vdqL',
  ),
  PlaylistGraduation(
    nome: 'Azul',
    color: Colors.blue,
    url: '1vdSW9QpiXZUIhx69ELBDb',
  ),
  PlaylistGraduation(
    nome: 'Vermelha',
    color: Colors.red,
    url: '095dbEGSufCjJqgj4ExAMC',
  ),
  PlaylistGraduation(
    nome: 'Laranja',
    color: Colors.orange,
    url: '1u1kWMWQIvPKk7MKJteflv',
  ),
];
