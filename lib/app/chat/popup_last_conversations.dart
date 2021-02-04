import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/chat_controller.dart';

class PopUpLastConversations extends StatelessWidget {
  final controller = GetIt.I.get<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: controller.conversations.value
          .map<Widget>((e) => CircleAvatar(
                backgroundImage: AssetImage(e.user.value.image.value),
              ))
          .toList(),
    );
  }
}
