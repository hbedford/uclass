import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uclass/src/login/login_controller.dart';
import 'package:uclass/src/widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  final controller = GetIt.I.get<LoginController>();
  TextStyle style;
  @override
  Widget build(BuildContext context) {
    style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
    return Scaffold(
      backgroundColor: Color(0xff050D10),
      body: LayoutBuilder(
        builder: (_, constraint) => Center(
          child: Column(
            children: [
              LogoWidget(),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff13191E),
                    borderRadius: BorderRadius.circular(20)),
                height: constraint.maxHeight * 0.6,
                width: constraint.maxWidth * 0.3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: constraint.maxHeight * 0.1,
                          width: constraint.maxWidth * 0.15,
                          decoration: BoxDecoration(
                              color: controller.type.value
                                  ? Color(0xff1D242A)
                                  : Color(0xff13191E),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20))),
                          child: Center(child: Text('Login', style: style)),
                        ),
                        Container(
                          height: constraint.maxHeight * 0.1,
                          width: constraint.maxWidth * 0.15,
                          decoration: BoxDecoration(
                              color: controller.type.value
                                  ? Color(0xff13191E)
                                  : Color(0xff1D242A),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20))),
                          child: Center(
                              child: Text(
                            'Registro',
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
