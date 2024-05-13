// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

final TextStyle menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
final Color mainColor = Color.fromRGBO(54, 55, 69, 1);

class MenuDashboard extends StatefulWidget {

  const MenuDashboard({super.key});

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  late double screenHight, screenWidth;
  bool menuisOpen = false;
  @override
  Widget build(BuildContext context) {
    screenHight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            menuisOpen = !menuisOpen;           
         });
          
        },),
      backgroundColor: mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            createMenu(context),
            dashBoard(context),
          ],     
          ),
      ),
      );
  }

  Widget createMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profil',style: menuFontStyle,),
            SizedBox(height: 10,),
            Text('Siparişler',style: menuFontStyle,),
            SizedBox(height: 10,),
            Text('Sepetim',style: menuFontStyle,),
            SizedBox(height: 10,),
            Text('Adres Ekle',style: menuFontStyle,),
            SizedBox(height: 10,),
            Text('Sepet Temizle',style: menuFontStyle,),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  Widget dashBoard(BuildContext context) {
    return AnimatedPositioned(
      top: menuisOpen ? 0.2*screenHight : 0,
      bottom: menuisOpen ? 0.2*screenHight : 0,
      left: menuisOpen ? 0.4*screenWidth: 0,
      right: menuisOpen ? -0.4*screenWidth: 0,
      duration: Duration(seconds: 1),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 10,
        color: mainColor,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('B2B', style: TextStyle(color: Colors.white, fontSize: 24),),
                  Icon(Icons.add_circle_outline, color: Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}