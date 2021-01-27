import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/popup_user_info_widget.dart';

class PopUpUserController {
  final ValueNotifier<OverlayEntry> overlayEntry;
  final ValueNotifier<bool> overlayIsShown;
  final ValueNotifier<Offset> position;
  final ValueNotifier<Size> anchorSize;
  final ValueNotifier<LayerLink> link;
  PopUpUserController()
      : this.overlayEntry = ValueNotifier<OverlayEntry>(null),
        this.overlayIsShown = ValueNotifier<bool>(false),
        this.position = ValueNotifier<Offset>(null),
        this.anchorSize = ValueNotifier<Size>(null),
        this.link = ValueNotifier<LayerLink>(LayerLink());
  void showOverlay(BuildContext context, GlobalKey key, Size size) {
    if (overlayIsShown.value) {
      overlayIsShown.value = false;
      overlayEntry.value.remove();
    }
    overlayEntry.value = _createOverlayEntry(context, key);
    Overlay.of(context).insert(overlayEntry.value);
    overlayIsShown.value = true;
    RenderBox renderBox = key.currentContext.findRenderObject();
    anchorSize.value = renderBox.size;
    position.value = renderBox.localToGlobal(Offset.zero);
  }

  OverlayEntry _createOverlayEntry(BuildContext context, GlobalKey key) {
    /*   RenderBox renderBox = context.findRenderObject(); */

    return OverlayEntry(builder: (ctxt) {
      // TODO: dynamically use the correct child width / height for
      // positioning us correctly on top + centered on the anchor
      /*    var childWidth = 0;
      var childHeight = 0.0;
      var childOffset =
          Offset(-(childWidth - anchorSize.width) / 2, -(childHeight)); */
/* 
      RenderBox box = key.currentContext.findRenderObject();
      Offset off = box.globalToLocal(Offset.zero);
      position.value = box.localToGlobal(off); */

      return PopUpUserInfoWidget();
    });
  }

  void hideOverlay() {
    overlayIsShown.value = false;
    overlayEntry.value.remove();
  }
}
