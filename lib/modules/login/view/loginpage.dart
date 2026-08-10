import 'package:appforro/modules/home/view/homepage.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:appforro/shared/widgets/custonbuttontext.dart';
import 'package:appforro/shared/widgets/custoninput.dart';
import 'package:appforro/shared/widgets/custonlabel.dart';
import 'package:appforro/shared/routes/route_transitions.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF5C00),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5C00),
        centerTitle: true,
        title: Applogo(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Container(
                height: 150,
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
          ),
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
                decoration: BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustonLabel(text: 'EMAIL'),
                      CustonInput(hint: 'seu@gmail.com'),
                      const SizedBox(height: 24),
                      CustonLabel(text: 'SENHA'),
                      CustonInput(
                        hint: '123456',
                        suffix: Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustonButtonText(
                          text: 'Esqueceu a senha?',
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: CustonButton(
                          text: 'Entrar',
                          borda: const BorderSide(
                            color: Color(0xFFFF5C00),
                            width: 2,
                          ),
                          textColor: Color(0xFFFFFFFF),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              sliderRouteTransition(
                                const HomePege(),
                                duration: Duration(milliseconds: 2000),
                                beginPosition: Offset(0, 1),
                              ),
                            );
                          },
                          color: Color(0xFFFF5C00),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustonButtonText(
                              text: 'Não posui conta?',
                              onPressed: () {},
                              color: Colors.white,
                            ),
                            CustonButtonText(
                              text: 'Cadastre-se',
                              onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
