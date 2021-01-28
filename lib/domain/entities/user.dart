import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/type_user.dart';

class User extends TypeUser {
  final ValueNotifier<int> id;
  final ValueNotifier<String> name;
  final ValueNotifier<String> phone;
  final ValueNotifier<String> image;
  final ValueNotifier<String> password;
  final ValueNotifier<String> email;
  final ValueNotifier<TextEditingController> editEmail;
  final ValueNotifier<TextEditingController> editPassword;
  final ValueNotifier<TextEditingController> editRepeatPassword;
  User({
    int id,
    String name,
    String image,
    String password,
    String phone,
    String email,
    int type,
  })  : this.id = ValueNotifier<int>(id),
        this.image = ValueNotifier<String>(image),
        this.name = ValueNotifier<String>(name),
        this.email = ValueNotifier<String>(email),
        this.password = ValueNotifier<String>(password),
        this.phone = ValueNotifier<String>(phone),
        this.editEmail = ValueNotifier<TextEditingController>(
          TextEditingController(text: email ?? ''),
        ),
        this.editPassword =
            ValueNotifier<TextEditingController>(TextEditingController()),
        this.editRepeatPassword =
            ValueNotifier<TextEditingController>(TextEditingController()),
        super(id: type);
}
