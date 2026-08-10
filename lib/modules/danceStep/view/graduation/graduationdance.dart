import 'package:appforro/modules/danceStep/model/graduationentity.dart';
import 'package:appforro/modules/danceStep/view/pagedance/dancepage.dart';
import 'package:appforro/modules/hearing/controller/controllerprogreshearing.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:flutter/material.dart';

class GraduationDance extends StatefulWidget {
  const GraduationDance({super.key});

  @override
  State<GraduationDance> createState() => _GraduationDance();
}

class _GraduationDance extends State<GraduationDance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF5C00),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5C00),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Graduações", style: AppTextStyles.title(fontSize: 25)),
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
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: ListView.builder(
                itemCount: graduations.length,
                itemBuilder: ((context, index) {
                  final graduation = graduations[index];
                  return Column(
                    children: [
                      SizedBox(height: 45),
                      CustonButton(
                        textColor: Color(0xFF000000),
                        text: graduation.label,
                        borda: BorderSide(color: graduation.color, width: 2),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DancePage(
                                onUpdate: (_) => setState(() {}),
                                danceSteps: graduation.danceSteps,
                                color: graduation.color,
                              ),
                            ),
                          );
                        },
                        color: graduation.color,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 250,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white,
                          color: graduation.color,
                          value: getValue(graduation.color),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
