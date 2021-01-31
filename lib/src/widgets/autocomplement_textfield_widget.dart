import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';

typedef AutoCompletedTextFieldItem<T>(BuildContext context, T suggestion);
typedef bool Filter<T>(T suggestion, String query);
typedef InputEventCallback<T>(T data);

class AutoCompletedTextField extends StatefulWidget {
  final InputEventCallback itemSubmitted;
  final String hint;
  final AutoCompletedTextFieldItem itemBuilder;
  final List list;
  final Filter filter;
  final Color backgroundColor;
  final Comparator sort;
  AutoCompletedTextField(
      {@required this.itemSubmitted,
      this.hint,
      @required this.itemBuilder,
      @required this.list,
      @required this.filter,
      @required this.sort,
      this.backgroundColor = Colors.transparent});
  @override
  _AutoCompletedTextFieldState createState() => _AutoCompletedTextFieldState();
}

class _AutoCompletedTextFieldState extends State<AutoCompletedTextField> {
  LayerLink link = LayerLink();
  TextEditingController controller = TextEditingController();
  Widget textField;
  OverlayEntry overlay;
  OverlayState overlayState;
  BuildContext contxt;
  onChange(String value) {
    this.overlayState = Overlay.of(contxt);

    if (value.isEmpty) {
      controller.clear();
      this.overlay?.remove();
      this.overlay = null;
    } else {
      List<String> list = [];
      widget.list.forEach((e) {
        if (widget.filter(e, value)) {
          list.add(e);
        }
      });
      list.sort(widget.sort);
      this.overlay?.remove();
      this.overlay = createOverlayEntry(list: List.of(list));
      this.overlayState.insert(this.overlay);
    }
  }

  @override
  void initState() {
    super.initState();
    textField = TextFieldWidget(
      controller: controller,
      onChange: onChange,
      hint: widget.hint,
    );
  }

  @override
  Widget build(BuildContext context) {
    contxt = context;
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
                    .map<Widget>((e) => InkWell(
                          onTap: () {
                            onChange('');
                            widget.itemSubmitted(e);
                          },
                          child: widget.itemBuilder(context, e),
                        ))
                    .toList()),
          ),
        ),
      );
    });
  }
}
