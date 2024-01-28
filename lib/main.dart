import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_bazar365/db/db_helper.dart';
import 'package:task_bazar365/services/theme_services.dart';
import 'package:task_bazar365/ui/screens/splash_screen.dart';
import 'package:task_bazar365/ui/theme.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
  await DBHelper().database;
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeServices _ts = ThemeServices();


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: _ts.theme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
// import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
// import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Motion Tab Bar Sample',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ParentScreen(title: 'Motion Tab Bar Sample'),
//     );
//   }
// }


// class MainPageContentComponent extends StatelessWidget {
//   const MainPageContentComponent({
//     required this.title,
//     required this.controller,
//     Key? key,
//   }) : super(key: key);

//   final String title;
//   final MotionTabBarController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 50),
//           const Text('Go to "X" page programmatically'),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () => controller.index = 0,
//             child: const Text('Dashboard Page'),
//           ),
//           ElevatedButton(
//             onPressed: () => controller.index = 1,
//             child: const Text('Home Page'),
//           ),
//           ElevatedButton(
//             onPressed: () => controller.index = 2,
//             child: const Text('Profile Page'),
//           ),
//           ElevatedButton(
//             onPressed: () => controller.index = 3,
//             child: const Text('Settings Page'),
//           ),
//         ],
//       ),
//     );
//   }
// }
