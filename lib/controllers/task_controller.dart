import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:task_bazar365/db/db_helper.dart';
import 'package:task_bazar365/models/task.dart';
import 'package:task_bazar365/ui/widgets/custom_toast.dart';

class TaskController extends GetxController {
  var taskList = [].obs;
  var addPrice = 0.obs;
  var allPrices = [];
  // var selectDate = DateTime.now().obs;
void updateSummation() {
    addPrice.value = 0; // Reset the summation
    for (var task in taskList) {
      if (task.actualPrice != null) {
        addPrice.value += int.parse(task.actualPrice!);
      }
    }
  }
  Future<void> getTask()async{
    taskList.clear();
   final List<Map<String, dynamic>> tasks = await DBHelper().queryAllRows();
   print(tasks);
   taskList.assignAll(tasks.map((data) => Task.fromMap(data)).toList());
  }

  addTask(Task task, BuildContext context)async{
    await DBHelper().insertTask(task);
    taskList.add(task);
    successToast(context: context, msg: "Item Added Successfully");
    getTask();
  }

  deleteTask(int? id)async{
    await DBHelper().delete(id!);
    // getTask();
  }

  deleteAllTasks()async{
    await DBHelper().deleteAllTasks();
    getTask();
  }

  markAsCompleted(int? id)async{
    await DBHelper().update(id!);
    getTask();
  }
}
