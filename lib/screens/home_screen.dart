import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bs_ui/circular_button.dart';
import 'package:bs_ui/screens/announcement_screen.dart';
import 'package:bs_ui/screens/bs_screen.dart';
import 'package:bs_ui/screens/exams_screen.dart';
import 'package:bs_ui/screens/lms_screen.dart';
import 'package:bs_ui/screens/notes_screen.dart';
import 'package:bs_ui/screens/profile_screen.dart';
import 'package:bs_ui/screens/info_screen.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentNavBarTab = 0;
  int _selectedFastAccessMenu = 0;
  bool _isClickedFAB = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<IconData> _icons = [
    FontAwesomeIcons.bullhorn,
    FontAwesomeIcons.chartBar,
    FontAwesomeIcons.alignLeft,
    FontAwesomeIcons.info,
    FontAwesomeIcons.book,
    FontAwesomeIcons.download
  ];

  AnimationController animationController;
  Animation degOneTranslationAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  secilenIcerik() {
    if (_selectedFastAccessMenu == 0) {
      return AnnouncementScreen();
    } else if (_selectedFastAccessMenu == 1) {
      return ExamsScreen();
    } else if (_selectedFastAccessMenu == 2) {
      return NotesScreen();
    } else if (_selectedFastAccessMenu == 3) {
      return YoksisInformationScreen();
    } else if (_selectedFastAccessMenu == 4) {
      return DbsScreen();
    } else if (_selectedFastAccessMenu == 5) {
      return LmsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: _appBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _floatingActionButton(),
          bottomNavigationBar: _bottomNavBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _profileInfo(),
              SizedBox(height: 0),
              _fastAccessMenus(),
              SizedBox(height: 0),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    secilenIcerik(),
                  ],
                ),
              ),
            ],
          ),
          endDrawer: Drawer(
            child: ListView(
              children: <Widget>[
                _drawerItems(
                    parentItemName: "Parent1", icon: FontAwesomeIcons.accusoft),
                _drawerItems(
                    parentItemName: "Parent2",
                    icon: FontAwesomeIcons.acquisitionsIncorporated),
                _drawerItems(
                    parentItemName: "Parent3", icon: FontAwesomeIcons.ad),
                _drawerItems(
                    parentItemName: "Parent4", icon: FontAwesomeIcons.adjust),
              ],
            ),
          ),
          endDrawerEnableOpenDragGesture: false,
        ),
      ),
    );
  }

  ExpansionTile _drawerItems({String parentItemName, IconData icon}) {
    return ExpansionTile(
      title: Text(
        parentItemName,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      leading: Icon(icon),
      children: <Widget>[
        ListTile(
          title: Text("Child1"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Child2"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Child3"),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _fastAccessMenus() {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Container(
        height: 90,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _icons.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildIcon(index),
                  ],
                ),
              );
            }),
      ),
    );

    /*return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _icons
          .asMap()
          .entries
          .map((MapEntry map) => _buildIcon(map.key))
          .toList(),
    );*/
  }

  Widget _buildIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.5, left: 6),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedFastAccessMenu = index;
          });
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).primaryColor),
          child: Icon(_icons[index],
              size: 24,
              color: _selectedFastAccessMenu == index
                  ? Theme.of(context).accentColor
                  : Colors.grey),
        ),
      ),
    );
  }

  Padding _profileInfo() {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Container(
        height: 140,
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => ProfileScreen())),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://obs.atauni.edu.tr/Resim/BinaryResimOku.aspx?id=825334&s=100&d=mm"),
                  radius: 50,
                  backgroundColor: Theme.of(context).accentColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  width: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Emirhan UZUNER",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Bilgisayar Mühendisliği (İ.Ö)",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Bilgi Sistemi",
        style: TextStyle(
            fontFamily: "PodkovaRegular",
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w700,
            fontSize: 22),
      ),
      leading: IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.message), onPressed: () {}),
      ],
    );
  }

  double getRadiansFromDegree(int degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  Widget _floatingActionButton() {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 1,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                IgnorePointer(
                  ignoring: false,
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(210),
                      degOneTranslationAnimation.value * 100),
                  child: CircularButton(
                    width: 20,
                    height: 20,
                    icon: Icon(
                      Icons.help,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onClick: () {
                      setState(() {
                        _currentNavBarTab = 6;
                      });
                    },
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),
                      degOneTranslationAnimation.value * 100),
                  child: CircularButton(
                    width: 20,
                    height: 20,
                    icon: Icon(
                      Icons.local_library,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onClick: () {
                      setState(() {
                        _currentNavBarTab = 7;
                      });
                    },
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(330),
                      degOneTranslationAnimation.value * 100),
                  child: CircularButton(
                    width: 20,
                    height: 20,
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onClick: () {
                      setState(() {
                        _currentNavBarTab = 8;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          FloatingActionButton(
            tooltip: "Hızlı Erişim",
            child: Icon(
              _isClickedFAB ? Icons.clear : Icons.add,
              size: 36,
              color:
                  _isClickedFAB ? Theme.of(context).accentColor : Colors.white,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            focusColor: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                _isClickedFAB = !_isClickedFAB;
                if (animationController.isCompleted) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Color _checkedColor(int index) {
    return _currentNavBarTab == index
        ? Theme.of(context).accentColor
        : Colors.grey;
  }

  void _closeFabAnimation() {
    if (animationController.isCompleted) {
      _isClickedFAB = false;
      animationController.reverse();
    }
  }

  BottomAppBar _bottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 12,
      child: Container(
        height: 60,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _checkedColor(0),
                ),
                iconSize: 36,
                onPressed: () {
                  setState(() {
                    _currentNavBarTab = 0;
                    _closeFabAnimation();
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.local_dining,
                  color: _checkedColor(1),
                ),
                iconSize: 36,
                padding: EdgeInsets.only(right: 60),
                onPressed: () {
                  setState(() {
                    _currentNavBarTab = 1;
                    _closeFabAnimation();
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: _checkedColor(2),
                ),
                iconSize: 36,
                onPressed: () {
                  setState(() {
                    _currentNavBarTab = 2;
                    _closeFabAnimation();
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: _checkedColor(3),
                ),
                iconSize: 36,
                onPressed: () {
                  setState(() {
                    _closeFabAnimation();
                    _scaffoldKey.currentState.openEndDrawer();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
