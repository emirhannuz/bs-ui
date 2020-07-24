import 'package:flutter/material.dart';

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Duyurular",
            style: TextStyle(
                fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        _duyurular(Theme.of(context).primaryColor),
        _duyurular(Theme.of(context).accentColor),
        _duyurular(Theme.of(context).primaryColor),
        _duyurular(Theme.of(context).accentColor),
        _duyurular(Theme.of(context).primaryColor),
      ],
    );
  }

  Widget _duyurular(Color color) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 7, 10, 0),
      height: 160,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5),
            height: 130,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 16, bottom: 16),
            width: MediaQuery.of(context).size.width * 0.88,
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Lorem Ipsum",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.9,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed adipiscing diam donec adipiscing tristique risus. Nisl tincidunt eget nullam non nisi est sit. Proin sagittis nisl rhoncus mattis.",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
