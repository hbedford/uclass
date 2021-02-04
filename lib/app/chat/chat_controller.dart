import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/conversation.dart';

class ChatController {
  final ValueNotifier<List<Conversation>> conversations;
  final notification;
  final ValueNotifier<LayerLink> link = ValueNotifier<LayerLink>(null);
  ChatController(
      {List<Conversation> conversations,
      bool notification = true,
      bool overlayIsShown})
      : this.conversations = ValueNotifier<List<Conversation>>(conversations),
        this.notification = ValueNotifier<bool>(notification);
  addConversation(Conversation c) => conversations.value.add(c);
  changeNotification(bool n) => notification.value = n;

  //CONTINUAR DAQUI

  changeLink(LayerLink value) => link.value = value;
  OverlayEntry _chatPopUp(BuildContext context) {
    final width = link.value.leaderSize.width;
    final height = link.value.leaderSize.height;
    return OverlayEntry(builder: (contt) {
      return /* Positioned(
          child: */
          Positioned(
        width: link.leaderSize.width * 5,
        child: CompositedTransformFollower(
          followerAnchor: Alignment.topRight,
          targetAnchor: Alignment.topRight,
          link: link,
          offset: Offset(-width, 0),
          child: Material(
            color: Colors.transparent,
            child: ClipRect(
                child: Container(
                    width: width * 5,
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.05),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.15, horizontal: width * 0.2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white54),
                    /* width: width, */
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(right: width * 0.1),
                                        child: Icon(Icons.alarm)),
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          newNotification.value.title.value,
                                          softWrap: true,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    changeNewNotification(null, context);
                                    /* newNotification.value.changeDisable(true); */
                                  })
                            ],
                          ),
                          Text(
                            newNotification.value.message.value,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ))),
          ),
          /* ) */
        ),
      );
    });
  }
}
