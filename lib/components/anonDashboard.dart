import 'package:flutter/material.dart';
import 'package:kepp/components/buildDialog.dart';
import 'package:kepp/components/userText.dart';
import 'package:kepp/models/keyboard.dart';

class AnonDashboardComponent extends StatefulWidget {
  AnonDashboardComponent(this.keyboardStream);
  final Stream<List<KeyboardBuild>> keyboardStream;
  @override
  _AnonDashboardComponentState createState() => _AnonDashboardComponentState();
}

class _AnonDashboardComponentState extends State<AnonDashboardComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<KeyboardBuild>>(
        stream: widget.keyboardStream,
        builder: (context, snapshot) {
          if (snapshot == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              itemCount: snapshot?.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xff324152),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          UserText(snapshot.data[index].userUid),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text('Nome: ' +
                                    snapshot.data[index].name.toString()),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  onPressed: () {
                                    showBuildDialog(
                                        context, snapshot.data[index]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
