import 'package:flutter/cupertino.dart';

class ChatController {
  final ValueNotifier<List<ConversationModel>> converstions =
      ValueNotifier<List<ConversationModel>>(null);
}
