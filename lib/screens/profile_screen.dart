import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.black54,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Profil Sayfası",
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
