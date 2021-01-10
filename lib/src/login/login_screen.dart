import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uclass/src/login/login_controller.dart';
import 'package:uclass/src/widgets/logo_widget.dart';

import 'package:flutter/foundation.dart' as platform;
import 'package:uclass/src/widgets/textfield_widget.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff13191E),
                      borderRadius: BorderRadius.circular(20)),
                  height: constraint.maxHeight * 0.6,
                  width: platform.kIsWeb
                      ? constraint.maxWidth * 0.3
                      : constraint.maxWidth * 0.8,
                  child: ValueListenableBuilder(
                      valueListenable: controller.type,
                      builder: (context, value, child) => value
                          ? register(constraint, context)
                          : login(constraint, context)))
            ],
          ),
        ),
      ),
    );
  }

  login(BoxConstraints constraint, BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          top(constraint),
          /* Container(
                      margin: EdgeInsets.only(top: constraint.maxHeight * 0.03),
                    ), */
          Column(
            children: [
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.email.value,
                  hint: 'E-mail'),
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.password.value,
                  hint: 'Senha'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                padding:
                    EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.1),
                /* shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ), */
                onPressed: () => null,
                child: Text(
                  'Entrar',
                  style: style,
                ),
              )
            ],
          ),
          FlatButton(
              onPressed: () => null,
              child: Text(
                'Problemas com login?',
                style: style.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ))
        ],
      );
  register(BoxConstraints constraint, BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          top(constraint),
          Column(
            children: [
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.email.value,
                  hint: 'E-mail'),
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.password.value,
                  hint: 'Senha'),
              TextFieldWidget(
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.02,
                    horizontal: constraint.maxWidth * 0.05,
                  ),
                  controller: controller.repeatPassword.value,
                  hint: 'Confirmar senha'),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: constraint.maxHeight * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () => null,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('PRÓXIMO'),
                ),
                RaisedButton(
                  onPressed: () => null,
                  color:
                      Theme.of(context).buttonTheme.colorScheme.primaryVariant,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Cancelar'),
                )
              ],
            ),
          )
        ],
      );
  top(BoxConstraints constraint) => Row(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.type,
            builder: (context, value, child) => GestureDetector(
              onTap: () => controller.changeType(false),
              child: Container(
                  height: constraint.maxHeight * 0.1,
                  width: platform.kIsWeb
                      ? constraint.maxWidth * 0.15
                      : constraint.maxWidth * 0.4,
                  decoration: BoxDecoration(
                      color: value ? Color(0xff1D242A) : Color(0xff13191E),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Center(
                      child: Text('Login',
                          style: style.copyWith(
                              color: value ? Color(0xff20C598) : null)))),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: controller.type,
              builder: (context, value, child) => GestureDetector(
                    onTap: () => controller.changeType(true),
                    child: Container(
                      height: constraint.maxHeight * 0.1,
                      width: platform.kIsWeb
                          ? constraint.maxWidth * 0.15
                          : constraint.maxWidth * 0.4,
                      decoration: BoxDecoration(
                          color: value ? Color(0xff13191E) : Color(0xff1D242A),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(20))),
                      child: Center(
                          child: Text(
                        'Registro',
                        style: style.copyWith(
                            color: value ? null : Color(0xff20C598)),
                      )),
                    ),
                  ))
        ],
      );
}
