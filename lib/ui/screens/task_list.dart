import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_bazar365/controllers/task_controller.dart';
import 'package:task_bazar365/models/task.dart';
import 'package:task_bazar365/ui/size_config.dart';
import 'package:task_bazar365/ui/theme.dart';
import 'package:task_bazar365/ui/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TaskController taskController = Get.put(TaskController());
  @override
  void initState() {
    super.initState();
    taskController.getTask();
    SizeConfig.orientation = Orientation.portrait;
    SizeConfig.screenHeight = 100;
    SizeConfig.screenWidth = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TaskController>(
        id: "getTask",
        builder: (_) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    globalText(
                        text: "Shopping Cart(${taskController.taskList.length})",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    SizedBox(
                      height: 5,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Add items worth ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Tk 30',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                          TextSpan(
                            text: 'for free shopping',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      borderRadius: BorderRadius.circular(100),
                      minHeight: 6.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    globalText(
                        text: "Added items(${taskController.taskList.length} items)",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(child: Obx(() {
                      if (taskController.taskList.isEmpty) {
                        return _noTasksMessage(context);
                      } else {
                        return AnimationLimiter(
                            child: Obx(
                          () => ListView.builder(
                              scrollDirection: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? Axis.vertical
                                  : Axis.horizontal,
                              itemCount: taskController.taskList.length,
                              itemBuilder: (BuildContext context, int index) {
                                Task task = taskController.taskList[index];
                                Future.delayed(Duration(milliseconds: 300), (){
                                  taskController.addPrice.value =
                                    taskController.addPrice.value +
                                        task.actualPrice!;
                                });
                                // Timer(1.seconds, () {
                                //   taskController.addPrice.value =
                                //     taskController.addPrice.value +
                                //         task.actualPrice!;
                                //  });
                  
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: Duration(milliseconds: 500 + index * 20),
                                  child: SlideAnimation(
                                    horizontalOffset: 400.0,
                                    child: FadeInAnimation(
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Image.asset(
                                                  task.image ?? '',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        globalText(
                                                            text: task.foodName,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black),
                                                        globalText(
                                                            text:
                                                                '৳ ${task.actualPrice}',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    100),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    if (task.id! >=
                                                                        0) {
                                                                      task.id =
                                                                          (task.id! -
                                                                              1);
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                      Icons.remove)),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              globalText(
                                                                  text:
                                                                      "1",
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color:
                                                                      Colors.black),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    if (task.id! >=
                                                                        0) {
                                                                      task.id =
                                                                          (task.id! +
                                                                              1);
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                      Icons.add)),
                                                            ],
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              taskController.taskList
                                                                  .remove(task);
                                                              taskController
                                                                  .deleteTask(
                                                                      task.id);
                                                            },
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                              size: 30,
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ));
                      }
                    }))
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.1),
                        blurRadius: 2,
                        offset: Offset(-1, -1), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            globalText(text: "Subtotal" ,fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
Obx(() =>                             globalText(text: taskController.addPrice.value == 0 ? '0' : taskController.addPrice.value.toString(),fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)
)                          ],
                        ),
                        ElevatedButton(
                           style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 50), //////// HERE
                ),
                          onPressed: (){}, child: globalText(text: "Checkout" ,fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white))
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }

  Widget _noTasksMessage(BuildContext context) {
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
