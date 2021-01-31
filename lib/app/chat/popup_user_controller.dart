import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/user.dart';
import 'package:uclass/src/widgets/popup_user_info_widget.dart';

class PopUpUserController {
  final ValueNotifier<OverlayEntry> overlayEntry;
  final ValueNotifier<bool> overlayIsShown;
  final ValueNotifier<Offset> position;
  final ValueNotifier<Size> anchorSize;
  final ValueNotifier<LayerLink> link;
  final ValueNotifier<User> user;
  PopUpUserController()
      : this.overlayEntry = ValueNotifier<OverlayEntry>(null),
        this.overlayIsShown = ValueNotifier<bool>(false),
        this.position = ValueNotifier<Offset>(null),
        this.anchorSize = ValueNotifier<Size>(null),
        this.user = ValueNotifier<User>(null),
        this.link = ValueNotifier<LayerLink>(LayerLink());
  void showOverlay(BuildContext context, GlobalKey key, Size size, User user) {
    changeUser(user);
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

  changeUser(User value) => user.value = value;
  OverlayEntry _createOverlayEntry(BuildContext context, GlobalKey key) {
    return OverlayEntry(builder: (ctxt) {
      return PopUpUserInfoWidget();
    });
  }

  void hideOverlay() {
    overlayIsShown.value = false;
    overlayEntry.value.remove();
  }
}
