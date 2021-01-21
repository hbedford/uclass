import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/home/home_controller.dart';
import 'package:uclass/src/home_pages/home_page_newclasse_desktop.dart';
import 'package:uclass/src/home_pages/home_page_dash_desktop.dart';
import 'package:uclass/src/home_pages/home_topbar_newclasse_desktop.dart';
import 'home_events.dart';
import 'home_leftside.dart';

class HomeDesktop extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  final controller = GetIt.I.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LeftSideDesktop(),
          Expanded(
              flex: 8,
              child: LayoutBuilder(
                builder: (_, constraint) => Container(
                  margin: EdgeInsets.symmetric(
                      vertical: constraint.maxHeight * 0.05,
                      horizontal: constraint.maxWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topBar(),
                      Expanded(
                          flex: 10,
                          child: LayoutBuilder(
                              builder: (_, constraints) => Row(
                                    children: [
                                      ValueListenableBuilder(
                                          valueListenable: controller.page,
                                          builder: (_, value, child) =>
                                              Expanded(
                                                flex: 9,
                                                child: value == 0
                                                    ? HomeDashDesktop()
                                                    : HomePageNewClassDesktop(),
                                              )),
                                      Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'EVENTOS',
                                                style: style.copyWith(
                                                    color: Colors.white54,
                                                    fontSize: 14),
                                              ),
                                              Expanded(
                                                  child: LayoutBuilder(
                                                      builder:
                                                          (_, constraint) =>
                                                              HomeEvents(
                                                                constraint:
                                                                    constraint,
                                                              )))
                                            ],
                                          ))
                                    ],
                                  ))),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  topBar() => Flexible(
        child: LayoutBuilder(
          builder: (_, constraint) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: constraint.maxWidth * 0.02,
                        top: constraint.maxHeight * 0.01,
                        bottom: constraint.maxHeight * 0.03),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/avatar.png'),
                      child: Stack(
                        children: [
                          Positioned(
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 4,
                            ),
                            bottom: 5,
                            right: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nome', style: style),
                      Text('Instituição',
                          style:
                              style.copyWith(fontSize: 12, color: Colors.grey))
                    ],
                  )
                ]),
              ),
              topCenterBar(),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => null,
                      icon: Icon(
                        Icons.notification_important,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () => null,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  topCenterBar() => Expanded(
      flex: 7,
      child: ValueListenableBuilder(
          valueListenable: controller.page,
          builder: (_, value, child) =>
              value == 1 ? HomeTopBarNewClassDesktop() : Container()));
}
