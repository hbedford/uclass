import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';

typedef AutoCompletedTextFieldItem<T>(BuildContext context, T suggestion);
typedef bool Filter<T>(T suggestion, String query);

class AutoCompletedTextField extends StatefulWidget {
  final String hint;
  final AutoCompletedTextFieldItem itemBuilder;
  final List list;
  final Filter filter;
  final Comparator sort;
  AutoCompletedTextField(
      {this.hint,
      @required this.itemBuilder,
      @required this.list,
      @required this.filter,
      @required this.sort});
  @override
  _AutoCompletedTextFieldState createState() => _AutoCompletedTextFieldState();
}

class _AutoCompletedTextFieldState extends State<AutoCompletedTextField> {
  LayerLink link = LayerLink();

  Widget textField;
  OverlayEntry overlay;
  onChange(String value) {
    print(value);
    if (value.isEmpty) {
      overlay.remove();
      setState(() {});
    } else {
      List<String> list = [];
      widget.list.forEach((e) {
        if (widget.filter(e, value)) {
          list.add(e);
        }
      });
      list.sort(widget.sort);

      overlay = createOverlayEntry(list: List.of(list));

      Overlay.of(context).insert(overlay);
      if (overlay == null) overlay.remove();
    }
  }

  @override
  void initState() {
    super.initState();
    textField = TextFieldWidget(
      onChange: onChange,
      hint: widget.hint,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: link,
      child: textField,
    );
  }

  OverlayEntry createOverlayEntry({List list}) {
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
                    .map<Widget>((e) => widget.itemBuilder(context, e))
                    .toList()),
          ),
        ),
      );
    });
  }
}
