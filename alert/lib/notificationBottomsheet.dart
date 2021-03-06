
import 'package:flutter/material.dart';

import 'notification.dart';


class NotificationBottomSheet extends StatefulWidget {

  NotificationBottomSheet(this._scrollController);

  ScrollController _scrollController;

  @override
  _NotificationBottomSheet createState() =>
      _NotificationBottomSheet(_scrollController);
}

class _NotificationBottomSheet extends State<NotificationBottomSheet> {

  List<AlertNotification> notifications;
  ScrollController _scrollController;

  _NotificationBottomSheet(this._scrollController);

  @override
  void initState() {
    super.initState();
    notifications = List<AlertNotification>();
    notifications.addAll([
      AlertNotification("Wind Warnings for Saturday 12 July",
          "Cancellation for the following areas: Torres Strait, "
              "Peninsula Coast and Cooktown Coast",
          DateTime(
            2020, 7, 12, 15, 30
          )),
      AlertNotification("Wind Warnings for Sunday 11 July",
          "Strong Wind Warnings for the following areas: "
              "South East Gulf of Carpentaria",
          DateTime(
            2020,  7, 11, 15, 50
          )),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 12.0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          AlertNotification notif = notifications[index];
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    notif.timeAdded.day.toString() + "-" + notif.timeAdded.month.toString() + "-" + notif.timeAdded.year.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: ListTile(
                    title: Text(
                      notif.title.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(notif.description.toString()),
                    leading: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.new_releases,
                          color: Colors.black,
                        ),
                        Text(notif.timeAdded.hour.toString() + ":" + notif.timeAdded.minute.toString()),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}

