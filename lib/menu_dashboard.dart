// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/material.dart';

final TextStyle menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
final Color mainColor = Color.fromRGBO(54, 55, 69, 1);

class MenuDashboard extends StatefulWidget  {

  const MenuDashboard({super.key});

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> with SingleTickerProviderStateMixin{
  late double screenHight, screenWidth;
  final Duration duration = Duration(milliseconds: 600);
  bool menuisOpen = false;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> scaleMenuAnimation;
  late Animation<Offset> menuOffsetAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween(begin: 1.0, end: 0.9).animate(controller);
    scaleMenuAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    menuOffsetAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    screenHight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if(menuisOpen){
              controller.reverse();
            }else{
              controller.forward();
            }
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
    return SlideTransition(
      position: menuOffsetAnimation,
      child: ScaleTransition(
        scale: scaleMenuAnimation,
        child: Padding(
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
        ),
      ),
    );
  }

  Widget dashBoard(BuildContext context) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: menuisOpen ? 0.4*screenWidth: 0,
      right: menuisOpen ? -0.4*screenWidth: 0,
      duration: duration,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          borderRadius: menuisOpen ? BorderRadius.all(Radius.circular(20)):null,
          elevation: 10,
          color: mainColor,
          child: SingleChildScrollView(
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
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 200,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(width: 100, margin: EdgeInsets.symmetric(horizontal: 12), child: Image.network('https://www.anadoluhayat.com.tr/img_content/agac4.jpg'),),
                          Container(width: 100, margin: EdgeInsets.symmetric(horizontal: 12), child: Image.network('https://image.milimaj.com/i/milliyet/75/869x477/619252d886b24521285d27f7.jpg'),),
                          Container(width: 100, margin: EdgeInsets.symmetric(horizontal: 12), child: Image.network('https://i.gazeteoksijen.com/storage/files/images/2023/04/15/bir-agac-oldugunde-ne-olur-vY1Q.jpg'),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Menu Item : $index'),
                        trailing: Icon(Icons.abc),
                      );
                    }, 
                    separatorBuilder: (context, index){
                      return Divider();
                    }, 
                    itemCount: 12)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}