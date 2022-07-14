import 'package:flutter/material.dart';
import '../../styles.dart';

class CustomAppbarWidget extends StatefulWidget {
  String mainTitle = "Riyasewana";
  bool leadingImg;
  bool logo;
  bool searchIcon;
  GlobalKey<ScaffoldState>? drawerKey = GlobalKey();

  CustomAppbarWidget(
      {required this.mainTitle,
      required this.leadingImg,
      required this.logo,
      required this.searchIcon,
      this.drawerKey});

  @override
  _CustomAppbarWidgetState createState() => new _CustomAppbarWidgetState();
}

class _CustomAppbarWidgetState extends State<CustomAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: widget.leadingImg
          ? Container()
          : GestureDetector(
              onTap: () => {Navigator.of(context).pop()},
              child: Image.asset('assets/icons/arrow-left.png'),
            ),
      title: widget.logo
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child:
                  Image.asset('assets/images/ChekenLogoSmall.png', height: 200),
            )
          : Center(
              child: Container(
                margin: const EdgeInsets.only(right: 40),
                child: Text(
                  widget.mainTitle,
                  style: HeaderStyle,
                ),
              ),
            ),
    );
  }
}
