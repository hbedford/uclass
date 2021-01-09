import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                Divider(),
                Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, int index) => CircleAvatar()))
              ],
            ),
          ),
          Expanded(
              flex: 9,
              child: Column(
                children: [],
              ))
        ],
      ),
    );
  }
}
