import 'package:appforro/modules/theory/model/theory.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:flutter/material.dart';

class Theorypage extends StatelessWidget {
  const Theorypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF5C00),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5C00),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Teoria", style: AppTextStyles.title(fontSize: 25)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Applogo()],
            ),
          ],
        ),
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
              child: ListView.separated(
                itemCount: theorys.length,
                itemBuilder: (_, index) {
                  final theory = theorys[index];
                  return ListTile(
                    title: Text(
                      theory.title,
                      style: AppTextStyles.title(fontSize: 20),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          theory.subtitle,
                          style: AppTextStyles.subtitle(fontSize: 15),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          theory.content,
                          style: AppTextStyles.body(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
