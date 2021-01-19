import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uclass/src/login/login_controller.dart';
import 'package:uclass/src/widgets/button_widget.dart';
import 'package:uclass/src/widgets/logo_widget.dart';

import 'package:flutter/foundation.dart' as platform;
import 'package:uclass/src/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  final controller = GetIt.I.get<LoginController>();
  final TextStyle style = TextStyle(
      fontFamily: 'Gotham',
      color: Colors.white,
      fontWeight: FontWeight.w100,
      fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  width: platform.kIsWeb &&
                          MediaQuery.of(context).size.width > 1320
                      ? constraint.maxWidth * 0.3
                      : constraint.maxWidth * 0.8,
                  child: LayoutBuilder(
                    builder: (_, constraints) => ValueListenableBuilder(
                        valueListenable: controller.type,
                        builder: (context, value, child) => value
                            ? register(constraints, context)
                            : login(constraints, context)),
                  )),
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    TextFieldWidget(
                      height: constraint.maxHeight * 0.1,
                      margin: EdgeInsets.symmetric(
                        vertical: constraint.maxHeight * 0.03,
                        horizontal: constraint.maxWidth * 0.15,
                      ),
                      controller: controller.email.value,
                      hint: 'E-mail',
                    ),
                    TextFieldWidget(
                        height: constraint.maxHeight * 0.1,
                        margin: EdgeInsets.symmetric(
                          vertical: constraint.maxHeight * 0.03,
                          horizontal: constraint.maxWidth * 0.15,
                        ),
                        controller: controller.password.value,
                        hint: 'Senha'),
                  ],
                ),
                ButtonWidget(
                  title: 'ENTRAR',
                  f: () => controller.confirm(context),
                  height: constraint.maxHeight * 0.1,
                  width: constraint.maxWidth * 0.25,
                  style:
                      style.copyWith(fontSize: 20, fontWeight: FontWeight.w100),
                ),
                FlatButton(
                    onPressed: () => null,
                    child: Text(
                      'Problemas com login?',
                      style: style.copyWith(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        decoration: TextDecoration.underline,
                      ),
                    ))
              ],
            ),
          )
        ],
      );
  register(BoxConstraints constraint, BuildContext context) =>
      ValueListenableBuilder(
        valueListenable: controller.step,
        builder: (_, value, child) => value == 2
            ? step3(constraint, context)
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  top(constraint),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: controller.step,
                      builder: (context, value, child) => value == 0
                          ? step1(constraint, context)
                          : step2(constraint, context),
                    ),
                  )
                ],
              ),
      );
  step1(BoxConstraints constraint, BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              TextFieldWidget(
                  height: constraint.maxHeight * 0.1,
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.03,
                    horizontal: constraint.maxWidth * 0.15,
                  ),
                  controller: controller.email.value,
                  hint: 'E-mail'),
              TextFieldWidget(
                  height: constraint.maxHeight * 0.1,
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.03,
                    horizontal: constraint.maxWidth * 0.15,
                  ),
                  controller: controller.password.value,
                  hint: 'Senha'),
              TextFieldWidget(
                  height: constraint.maxHeight * 0.1,
                  margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.03,
                    horizontal: constraint.maxWidth * 0.15,
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
                ButtonWidget(
                  title: 'PRÓXIMO',
                  f: () => controller.changeStep(1),
                  height: constraint.maxHeight * 0.1,
                  width: constraint.maxWidth * 0.3,
                  style:
                      style.copyWith(fontWeight: FontWeight.w100, fontSize: 20),
                ),
                /* RaisedButton(
                  onPressed: () => controller.changeStep(1),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('PRÓXIMO'),
                ), */
                ButtonWidget(
                  title: 'Cancelar',
                  color:
                      Theme.of(context).buttonTheme.colorScheme.primaryVariant,
                  f: () => controller.changeStep(1),
                  height: constraint.maxHeight * 0.1,
                  width: constraint.maxWidth * 0.3,
                  style:
                      style.copyWith(fontWeight: FontWeight.w100, fontSize: 20),
                ),
                /* RaisedButton(
                  onPressed: () => null,
                  color:
                      Theme.of(context).buttonTheme.colorScheme.primaryVariant,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Cancelar'),
                ) */
              ],
            ),
          )
        ],
      );
  step2(BoxConstraints constraint, BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                  valueListenable: controller.email.value,
                  builder: (context, value, child) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: constraint.maxWidth * 0.25,
                            vertical: constraint.maxHeight * 0.05),
                        child: Text(
                          'Enviamos um código para seu e-mail ****@gmail.com',
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      )),
              TextFieldWidget(
                margin: EdgeInsets.symmetric(
                    horizontal: constraint.maxWidth * 0.15),
                controller: controller.code.value,
                hint: 'Digite aqui seu codigo',
              ),
            ],
          ),
          Text(
            'Reenviar codigo 00:57',
            style: style.copyWith(
                decoration: TextDecoration.underline,
                fontSize: 12,
                color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWidget(
                  title: 'CONFIRMAR',
                  f: () => controller.changeStep(2),
                  height: constraint.maxHeight * 0.1,
                  width: constraint.maxWidth * 0.3,
                  style: style),
              ButtonWidget(
                title: 'voltar',
                color: Theme.of(context).buttonTheme.colorScheme.primaryVariant,
                f: () => controller.changeStep(0),
                height: constraint.maxHeight * 0.1,
                width: constraint.maxWidth * 0.3,
                style: style,
              ),
            ],
          )
        ],
      );
  step3(BoxConstraints constraint, BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Complete seu perfil',
            style: style.copyWith(fontWeight: FontWeight.w100, fontSize: 20),
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.png'),
            radius: constraint.maxWidth * 0.1,
            child: Stack(
              children: [
                Positioned(
                  child: CircleAvatar(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  bottom: 0,
                  right: 0,
                )
              ],
            ),
          ),
          TextFieldWidget(
            controller: controller.name.value,
            margin:
                EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.15),
            hint: 'Nome',
          ),
          Column(children: [
            Text('Eu sou...',
                style: style.copyWith(fontWeight: FontWeight.w100)),
            Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Professor', 'Aluno', 'Outro']
                  .map((e) => ValueListenableBuilder(
                      valueListenable: controller.function,
                      builder: (context, value, child) => RaisedButton(
                          padding: EdgeInsets.symmetric(
                              vertical: constraint.maxHeight * 0.02,
                              horizontal: constraint.maxWidth * 0.05),
                          color: value == e
                              ? Colors.blueAccent
                              : Colors.transparent,
                          onPressed: () => controller.changeFunction(e),
                          // decoration: BoxDecoration(
                          //     color: Colors.blue,
                          //     borderRadius:
                          //         BorderRadius.circular(20)),

                          child: Text(e, style: style))))
                  .toList(),
            ),
          ]),
          ButtonWidget(
            title: 'CONFIRMAR',
            f: () => controller.confirm(context),
            height: constraint.maxHeight * 0.1,
            width: constraint.maxWidth * 0.3,
            style: style,
          ),
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
                      ? constraint.maxWidth * 0.5
                      : constraint.maxWidth * 0.5,
                  decoration: BoxDecoration(
                      color: value ? Color(0xff1D242A) : Color(0xff13191E),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Center(
                      child: Text('Login',
                          style: style.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
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
                          ? constraint.maxWidth * 0.5
                          : constraint.maxWidth * 0.5,
                      decoration: BoxDecoration(
                          color: value ? Color(0xff13191E) : Color(0xff1D242A),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(20))),
                      child: Center(
                          child: Text(
                        'Registro',
                        style: style.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: value ? null : Color(0xff20C598)),
                      )),
                    ),
                  ))
        ],
      );
}
