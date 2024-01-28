import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:task_bazar365/ui/screens/home_screen.dart';
import 'package:task_bazar365/ui/widgets/customAppBar_Widget.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ParentScreenState createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
   _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Cart",
        useSafeArea: true, 
        labels: const ["Home", "Category", "Cart", "Search", "Menu"],
        icons: const [Icons.home_filled, Icons.dashboard, Icons.shopping_cart, Icons.search, Icons.menu],
        
        badges: [
          null,
          null,
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white,),
            padding: const EdgeInsets.all(2),
            child: const Center(
              child: Text(
                '9',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          null,
          null
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.grey,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.blue[900],
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(), 
        controller: _motionTabBarController,
        children: const <Widget>[
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
