import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<DropdownMenuItem<String>> _dropDownItems = [
    'Bilgisayar Mühendisliği(İ.Ö)',
    'İşletme'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  String _dropDownValue = "Bilgisayar Mühendisliği(İ.Ö)";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 15),
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 7),
              child: Text(
                "Harf Notları (Bulunulan Dönem)",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Center(
              child: DropdownButton<String>(
                onChanged: (value) {
                  setState(() {
                    _dropDownValue = value;
                  });
                },
                elevation: 16,
                icon: Icon(FontAwesomeIcons.angleDown),
                value: _dropDownValue,
                focusColor: Theme.of(context).accentColor,
                items: _dropDownItems,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 7, right: 7),
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: _dataColName(
                          text: "Ders Kodu",
                          fontSize: 16,
                          weight: FontWeight.w500),
                    ),
                    DataColumn(
                      label: _dataColName(
                          text: "Ders Adı",
                          fontSize: 16,
                          weight: FontWeight.w500),
                    ),
                    DataColumn(
                        label: _dataColName(
                            text: "Harf Notu",
                            fontSize: 16,
                            weight: FontWeight.w500),
                        numeric: true),
                  ],
                  rows: _selectedDepartmanNotes.call(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DataRow> _selectedDepartmanNotes() {
    /*bölüm ismiyle değilde index ile nasıl yapılacağını öğren*/
    if (_dropDownValue == "İşletme") {
      return [
        _createNote(
          lectureCode: "IŞL1007",
          lectureName: "İşletme Bilimlerine Giriş",
          note: "BB",
        ),
        _createNote(
          lectureCode: "IŞL1009",
          lectureName: "Matematik I",
          note: "BA",
        ),
        _createNote(
          lectureCode: "İŞL1001",
          lectureName: "Genel Muhasebe",
          note: "BB",
        ),
        _createNote(
          lectureCode: "IŞL1005",
          lectureName: "İktisada Giriş ",
          note: "FF",
        ),
      ];
    } else {
      return [
        _createNote(
          lectureCode: "BM-204",
          lectureName: "İleri Programlama",
          note: "AA",
        ),
        _createNote(
          lectureCode: "BM-308",
          lectureName: "PARALEL PROGRAMLAMAYA GİRİŞ",
          note: "AA",
        ),
        _createNote(
          lectureCode: "FIZ-102",
          lectureName: "Fizik II",
          note: "FF",
        )
      ];
    }
  }

  Text _dataColName({String text, double fontSize, FontWeight weight}) {
    return Text(
      text.length > 22 ? text.split(" ").join("\n") : text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
      ),
    );
  }

  DataRow _createNote({String lectureCode, String lectureName, String note}) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            lectureCode,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        DataCell(
          Text(
            lectureName.length > 22
                ? lectureName.split(" ").join("\n")
                : lectureName,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        DataCell(
          Text(
            note,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
