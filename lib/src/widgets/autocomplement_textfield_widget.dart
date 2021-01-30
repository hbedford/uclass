import 'package:flutter/material.dart';

class AutoCompletedTextField extends StatefulWidget {
  final BuildContext context;
  AutoCompletedTextField({@required this.context});
  @override
  _AutoCompletedTextFieldState createState() => _AutoCompletedTextFieldState();
}

class _AutoCompletedTextFieldState extends State<AutoCompletedTextField> {
  LayerLink link = LayerLink();

  TextField textField;
  OverlayEntry overlay;
  onChange(String value) {
    print(value);
    if (value.isEmpty) {
      overlay.remove();
      setState(() {});
    } else {
      List<String> moka = ['Hugo', 'Bruno', 'Marcio', 'hugo bedford'];
      List<String> list = [];
      moka.forEach((e) {
        if (value.toLowerCase().contains(e.toLowerCase())) {
          print(e);
          list.add(e);
        }
      });

      overlay = createOverlayEntry(list: List.of(list));

      Overlay.of(context).insert(overlay);
      if (overlay == null) overlay.remove();
      /* setState(() {}); */
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textField = TextField(
      onChanged: onChange,
    );
  }

  /* @override
  void dispose() {
    setState(() {
      overlay.remove();
      overlay.dispose();
      textField = null;
      super.dispose();
    });
  } */

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: link,
      child: textField,
    );
  }

  OverlayEntry createOverlayEntry({List<String> list}) {
    final Size textFieldSize = (context.findRenderObject() as RenderBox).size;
    final width = textFieldSize.width;
    final height = textFieldSize.height;
    return OverlayEntry(builder: (context) {
      return Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: link,
          showWhenUnlinked: false,
          offset: Offset(0.0, height),
          child: Material(
            color: Colors.transparent,
            child: Column(
                children: list
                    .map((e) => Container(
                        width: width,
                        height: 30,
                        color: Colors.blue,
                        child: Text(e)))
                    .toList()),
          ),
        ),
      );
    });
  }
}
