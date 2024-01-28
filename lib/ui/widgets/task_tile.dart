import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_bazar365/controllers/task_controller.dart';
import 'package:task_bazar365/models/task.dart';
import 'package:task_bazar365/ui/theme.dart';

class TaskTile extends StatelessWidget {
  TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(child: Image.asset(task.image ?? '')),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                         task.plastic == "PLASTIC FREE" ? Container(
                          padding: const EdgeInsets.all(3),
                          color: HexColor("B2F5EA"),
                          child: globalText(text: task.plastic, fontSize: 12.0, fontWeight: FontWeight.bold, color: HexColor("234E52")),
                         ) : globalText(text: task.plastic, fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black),
                        ],
                      ),
                      globalText(text: task.inStock, fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.green),
                      globalText(text: task.foodName, fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
                      globalText(text: "${task.kg.toString()} kg", fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.grey),
                      Row(
                        children: [
                          globalText(text: "৳ ${task.actualPrice}", fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                          SizedBox(width: 10,),
                          globalText(text: "৳ ${task.saveMoney.toString()}", fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.green, lineInText: true),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      Positioned(
        top: 20,
        left: 20,
        child: InkWell(
          onTap: ()async{
            
            await _taskController.addTask(task, context);
            
          },
          child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.green
          ),
          child: Icon(Icons.add, color: Colors.white,),
                ),
        ))
      // RotatedBox(
          //   quarterTurns: 1,
          //   child: Text('COMPLETED',style: TextStyle(color: Colors.black)),
          // )
      ],
    );
  
  }
}



Text globalText({String? text, required double fontSize, required FontWeight fontWeight, required Color color, bool? lineInText}){
  return Text(text ?? '', style: TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: lineInText == true? TextDecoration.lineThrough: TextDecoration.none
  ),);
}