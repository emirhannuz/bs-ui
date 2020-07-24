import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExamsScreen extends StatefulWidget {
  @override
  _ExamsScreenState createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
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
                "Sınav Sonuçları (Bulunulan Dönem)",
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
                  sortAscending: false,
                  sortColumnIndex: 4,
                  showCheckboxColumn: true,
                  columns: [
                    DataColumn(
                      label: _dataColName(
                          text: "Ders Adı",
                          fontSize: 16,
                          weight: FontWeight.w500),
                    ),
                    DataColumn(
                      label: _dataColName(
                          text: "Sınav Adı",
                          fontSize: 16,
                          weight: FontWeight.w500),
                    ),
                    DataColumn(
                      label: _dataColName(
                          text: "Etki Oranı",
                          fontSize: 16,
                          weight: FontWeight.w500),
                    ),
                    DataColumn(
                      label: _dataColName(
                          text: "Sınav Ortalaması",
                          fontSize: 16,
                          weight: FontWeight.w500),
                    ),
                    DataColumn(
                      label: _dataColName(
                          text: "Not", fontSize: 16, weight: FontWeight.w500),
                    ),
                  ],
                  rows: _selectedDepartmanExams.call(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _dataColName({String text, double fontSize, FontWeight weight}) {
    return Text(
      text.length > 15 ? text.split(" ").join("\n") : text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
      ),
    );
  }

  List<DataRow> _selectedDepartmanExams() {
    /*bölüm ismiyle değilde index ile nasıl yapılacağını öğren*/
    if (_dropDownValue == "İşletme") {
      return [
        _createRow(
          lecture: "Hukukun Temel Kavramları",
          examName: "Vize",
          rate: 30.0,
          average: -1,
          note: "41.25",
        ),
        _createRow(
          lecture: "Hukukun Temel Kavramları",
          examName: "Final",
          rate: 70.0,
          average: -1,
          note: "23.75",
        ),
        _createRow(
          lecture: "Hukukun Temel Kavramları",
          examName: "Bütünleme",
          rate: 70.0,
          average: -1,
          note: "25",
        ),
        _createRow(
          lecture: "Borçlar Hukuku",
          examName: "Vize",
          rate: 30.0,
          average: -1,
          note: "5",
        ),
        _createRow(
          lecture: "Borçlar Hukuku",
          examName: "Final",
          rate: 70.0,
          average: -1,
          note: "10",
        ),
        _createRow(
          lecture: "Borçlar Hukuku",
          examName: "Bütünleme",
          rate: 70.0,
          average: -1,
          note: "12.5",
        ),
        _createRow(
          lecture: "Türk Dili I",
          examName: "Vize",
          rate: 30.0,
          average: -1,
          note: "46.25",
        ),
        _createRow(
          lecture: "Türk Dili I",
          examName: "Final",
          rate: 70.0,
          average: -1,
          note: "51.25",
        )
      ];
    } else {
      return [
        _createRow(
          lecture: "Fizik II",
          examName: "Ödev Ort.",
          rate: 15.0,
          average: 24,
          note: "E",
        ),
        _createRow(
          lecture: "Fizik II",
          examName: "Lab.",
          rate: 15.0,
          average: 58,
          note: "55",
        ),
        _createRow(
          lecture: "Fizik II",
          examName: "Final",
          rate: 70.0,
          average: 41,
          note: "32",
        ),
        _createRow(
          lecture: "Fizik II",
          examName: "Bütünleme",
          rate: 70.0,
          average: 46,
          note: "27",
        ),
        _createRow(
          lecture: "PARALEL PROGRAMLAMAYA GİRİŞ",
          examName: "Vize",
          rate: 30.0,
          average: 18.0,
          note: "10",
        ),
        _createRow(
          lecture: "PARALEL PROGRAMLAMAYA GİRİŞ",
          examName: "Final",
          rate: 70.0,
          average: 28.0,
          note: "10",
        ),
      ];
    }
  }

  DataRow _createRow(
      {String lecture,
      String examName,
      double rate,
      double average,
      String note}) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            lecture.length > 18 ? lecture.split(" ").join("\n") : lecture,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        DataCell(
          Text(
            examName,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        DataCell(
          Text(
            rate.toString(),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        DataCell(
          Text(
            average < 0 ? " " : average.toString(),
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
