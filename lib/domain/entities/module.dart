import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:uclass/src/widgets/dialog_edit_module_widget.dart';

import 'activity.dart';

class Module {
  final ValueNotifier<int> id;
  final ValueNotifier<String> name;
  final ValueNotifier<TextEditingController> nameEdit;
  final ValueNotifier<List<Activity>> activitys;
  Module({int id, String name, String nameEdit, List<Activity> activitys})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.nameEdit = ValueNotifier<TextEditingController>(
            TextEditingController(text: nameEdit ?? '')),
        this.activitys = ValueNotifier<List<Activity>>(activitys ??
            [
              Activity(),
              Activity(),
              Activity(),
            ]);
  addActivity() {
    activitys.value.add(Activity());
    activitys.notifyListeners();
  }

  save() {
    name.value = nameEdit.value.text;
  }

  dialogEditModule(BuildContext context) => showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: '',
        /* 
        barrierColor: Colors.white54, */
        transitionDuration: Duration(milliseconds: 20),
        pageBuilder: (ctx, anim1, anim2) =>
            /* SizedBox(
          height: MediaQuery.of(ctx).size.height * 0.5,
          width: MediaQuery.of(ctx).size.width * 0.5,
          child: Material(
            color: Colors.transparent,
            child: */
            DialogEditModuleWidget(),
        /*   ),
        ), */
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 8 * anim1.value, sigmaY: 8 * anim1.value),
          child: FadeTransition(
            child: Center(child: child),
            opacity: anim1,
          ),
        ),
        context: context,
      );
}
