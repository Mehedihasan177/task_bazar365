import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_bazar365/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:task_bazar365/ui/screens/task_list.dart';
import '../theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.leadingWidget}) : super(key: key);
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Fruits & Vegetales", style: TextStyle(fontWeight: FontWeight.bold, color: HexColor("#333333")),),
      backgroundColor: Colors.grey.withOpacity(0.1),
      elevation: 0,
      leading: leadingWidget,
      actions: [
        IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(
              Get.isDarkMode
                  ? Icons.wb_sunny_outlined
                  : Icons.nightlight_round_outlined,
            ),
          ),
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
        
        IconButton(
          onPressed: () {
            Get.to(TaskList());
          },
          icon: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(
               Icons.favorite_border,
            ),
          ),
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
