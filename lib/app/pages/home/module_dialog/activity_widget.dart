import 'package:flutter/material.dart';
import 'package:uclass/app/pages/home/module_dialog/module_warning_widget.dart';
import 'package:uclass/domain/entities/activity.dart';

import 'module_correction_widget.dart';
import 'module_live_widget.dart';
import 'module_material_widget.dart';
import 'module_video_widget.dart';

class ActivityModuleWidget extends StatelessWidget {
  final Activity activity;
  final BoxConstraints constraint;
  ActivityModuleWidget({this.activity, this.constraint});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: activity.type,
      builder: (_, value, child) => DragTarget(
        onAccept: activity.setType,
        builder: (context, candidateData, rejectedData) => Container(
          margin: EdgeInsets.only(top: constraint.maxHeight * 0.03),
          height: constraint.maxHeight *
              (activity.type.value != null && activity.type.value.id.value == 2
                  ? 0.5
                  : 0.3),
          width: constraint.maxWidth,
          child: Stack(
            children: [
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (_, constraint) => Container(
                    margin: EdgeInsets.only(
                        top: constraint.maxHeight * 0.02,
                        left: constraint.maxWidth * 0.02),
                    height: constraint.maxHeight * 0.8,
                    width: constraint.maxWidth * 0.98,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 7,
                            child: LayoutBuilder(
                              builder: (_, constraint) => Container(
                                padding:
                                    EdgeInsets.all(constraint.maxHeight * 0.05),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: activity.type.value == null
                                            ? Colors.transparent
                                            : activity.type.value.color.value,
                                        width: 2),
                                    color: Colors.black87),
                                child: type(activity),
                              ),
                            )),
                        Flexible(
                          flex: 1,
                          child: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.close),
                              onPressed: () => activity.setType(null)),
                        ),
                        Flexible(flex: 2, child: Container())
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: activity.type.value != null,
                  child: activity.type.value != null
                      ? Image.asset(activity.type.value.image.value)
                      : Container())
            ],
          ),
        ),
      ),
    );
  }

  type(Activity activity) => activity.type.value != null
      ? activity.type.value.id.value == 1
          ? ModuleLiveWidget()
          : activity.type.value.id.value == 2
              ? ModuleVideoWidget()
              : activity.type.value.id.value == 3
                  ? ModuleMaterialWidget()
                  : activity.type.value.id.value == 4
                      ? ModuleCorrectionWidget()
                      : ModuleWarningWidget()
      : Center(
          child: Text(
            'ADICIONAR ITEM',
          ),
        );
}
