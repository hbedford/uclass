import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/chat_controller.dart';

class PopUpLastConversations extends StatefulWidget {
  @override
  _PopUpLastConversationsState createState() => _PopUpLastConversationsState();
}

class _PopUpLastConversationsState extends State<PopUpLastConversations> {
  final controller = GetIt.I.get<ChatController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.conversations,
      builder: (_, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: controller.disableConversations
            .map<Widget>((e) => CompositedTransformTarget(
                  link: controller.link,
                  child: InkWell(
                    onTap: () => e.changeActive(),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(e.user.value.image.value),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
