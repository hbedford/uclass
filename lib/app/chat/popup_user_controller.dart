import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/popup_user_info_widget.dart';

class PopUpUserController {
  final ValueNotifier<OverlayEntry> overlayEntry;
  final ValueNotifier<bool> overlayIsShown;
  final ValueNotifier<Offset> position;
  final ValueNotifier<Size> anchorSize;
  PopUpUserController()
      : this.overlayEntry = ValueNotifier<OverlayEntry>(null),
        this.overlayIsShown = ValueNotifier<bool>(false),
        this.position = ValueNotifier<Offset>(null),
        this.anchorSize = ValueNotifier<Size>(null);
  void showOverlay(BuildContext context, GlobalKey key, Size size) {
    if (overlayIsShown.value) return;
    overlayEntry.value = _createOverlayEntry(context, key);
    anchorSize.value = size;
    Overlay.of(context).insert(overlayEntry.value);
    overlayIsShown.value = true;
  }

  OverlayEntry _createOverlayEntry(BuildContext context, GlobalKey key) {
    /*   RenderBox renderBox = context.findRenderObject(); */

    return OverlayEntry(builder: (context) {
      // TODO: dynamically use the correct child width / height for
      // positioning us correctly on top + centered on the anchor
      /*    var childWidth = 0;
      var childHeight = 0.0;
      var childOffset =
          Offset(-(childWidth - anchorSize.width) / 2, -(childHeight)); */
      RenderBox box = key.currentContext.findRenderObject();
      position.value = box.localToGlobal(Offset.zero);
      return PopUpUserInfoWidget();
    });
  }

  void hideOverlay() {
    overlayIsShown.value = false;
    overlayEntry.value.remove();
  }
}
