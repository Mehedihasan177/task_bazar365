// ignore_for_file: deprecated_member_use, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_bazar365/controllers/task_controller.dart';
import 'package:task_bazar365/data_insertion/data_insertion.dart';
import 'package:task_bazar365/models/task.dart';
import 'package:task_bazar365/ui/screens/task_list.dart';
import 'package:task_bazar365/ui/size_config.dart';
import 'package:task_bazar365/ui/theme.dart';
import 'package:task_bazar365/ui/widgets/customAppBar_Widget.dart';
import 'package:task_bazar365/ui/widgets/dropdown_button.dart';
import 'package:task_bazar365/ui/widgets/task_tile.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _taskController = Get.put(TaskController());
List<Task> informations = GetFoodList.foodList;
  @override
  void initState() {
    super.initState();
    _taskController.addPrice.value = 0;
    // _taskController.getTask();
    SizeConfig.orientation = Orientation.portrait;
    SizeConfig.screenHeight = 100;
    SizeConfig.screenWidth = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: DropdownButtonWidget(show: true,)),
                SizedBox(width: 10,),
                Expanded(child: DropdownButtonWidget(show: false))
              ],
            ),
            _tasks(),
          ],
        ),
      ),
     
    );
  }

  Widget _tasks() {
    var size1 = MediaQuery.of(context).size;
    final double itemHeight = (size1.height - kToolbarHeight - 10) / 3;
    final double itemWidth = size1.width / 2;
    var width = MediaQuery.of(context).size.width;
    return Expanded(child: AnimationLimiter(
          child: GridView.builder(  
              itemCount: informations.length,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              
              ),  
              itemBuilder: (BuildContext context, int index){  
                Task task = informations[index];
                return TaskTile(task: task,);  
              },  
            )),
    );
  }
  Widget _noTasksMessage() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const SizedBox(
                    height: 0,
                  )
                : const SizedBox(
                    height: 50,
                  ),
            SvgPicture.asset(
              'images/task.svg',
              height: 200,
              color: primaryClr.withOpacity(0.5),
              semanticsLabel: 'Tasks',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("There Is No Tasks"),
          ],
        ),
      ),
    );
  }

}
