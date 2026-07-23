import 'package:appforro/modules/hearing/model/hearing.dart';
import 'package:flutter/material.dart';

class Hearinggraduatinentity {
  const Hearinggraduatinentity({
    required this.color,
    required this.label,
    required this.hearing,
  });

  final Color color;
  final String label;
  final List<Hearing> hearing;
}

List<Hearinggraduatinentity> hearinggraduatinentitys = [
  Hearinggraduatinentity(
    color: Colors.yellow,
    label: 'Amarelo',
    hearing: hearingYellow,
  ),
  Hearinggraduatinentity(
    color: Colors.blue,
    label: 'Azul',
    hearing: hearingBlue,
  ),
  Hearinggraduatinentity(
    color: Colors.red,
    label: 'Vermelho',
    hearing: hearingRed,
  ),
  Hearinggraduatinentity(
    color: Colors.orange,
    label: 'Laranja',
    hearing: hearingOrange,
  ),
];
