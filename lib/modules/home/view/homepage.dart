import 'package:appforro/core/routes/approutes.dart';
import 'package:appforro/modules/approval/view/approval_page.dart';
import 'package:appforro/modules/register/model/user_model.dart';
import 'package:appforro/modules/register/model/user_role.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/carousel_item.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePege extends StatelessWidget {
  const HomePege({super.key, this.currentUser});

  final UserModel? currentUser;

  @override
  Widget build(BuildContext context) {
    final isProfessor = currentUser?.role == UserRole.professor;

    return Scaffold(
      backgroundColor: Color(0xFFFF5C00),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5C00),
        centerTitle: true,
        title: Applogo(),
        actions: [
          if (isProfessor)
            IconButton(
              tooltip: 'Matrículas pendentes',
              icon: const Icon(Icons.how_to_reg),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const ApprovalPage()));
              },
            ),
        ],
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * .80,
            width: MediaQuery.of(context).size.height * .40,
            margin: const EdgeInsets.only(bottom: 15),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Bem-vindo", style: AppTextStyles.title(fontSize: 35)),

                    const SizedBox(height: 40),
                    Container(
                      height: 220,
                      width: 220,
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
                    const SizedBox(height: 50),
                    CustonButton(
                      text: 'Passos',
                      borda: const BorderSide(
                        color: Color(0xFFFF5C00),
                        width: 2,
                      ),
                      textColor: Color(0xFFFFFFFF),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.graduationHearing);
                      },
                      color: Color(0xFFFF5C00),
                    ),
                    const SizedBox(height: 20),
                    CustonButton(
                      borda: const BorderSide(
                        color: Color(0xFFFF5C00),
                        width: 2,
                      ),
                      text: 'Sabatinas',
                      textColor: Color(0xFF000000),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.graduationDanceDriven);
                      },
                      color: Color(0xFFFFFFFF),
                    ),
                    const SizedBox(height: 20),
                    CustonButton(
                      borda: const BorderSide(
                        color: Color(0xFFFF5C00),
                        width: 2,
                      ),
                      text: 'Teoria',
                      textColor: Color(0xFFFF5C00),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.graduationHearing);
                      },
                      color: Color(0xFF000000),
                    ),
                    const SizedBox(height: 20),
                    CustonButton(
                      text: 'Playlist',
                      borda: const BorderSide(
                        color: Color(0xFFFF5C00),
                        width: 2,
                      ),
                      textColor: Color(0xFFFFFFFF),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.graduationPlaylist);
                      },
                      color: Color(0xFFFF5C00),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Professores",
                      style: AppTextStyles.title(fontSize: 20),
                    ),
                    CarouselSlider(
                      items: [
                        Carouselitem(
                          imagePath: 'professor.jpg',
                          text: 'Tio tico',
                        ),
                        Carouselitem(
                          imagePath: 'professora.jpg',
                          text: 'Tia paulinha',
                        ),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 1,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.easeInBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
