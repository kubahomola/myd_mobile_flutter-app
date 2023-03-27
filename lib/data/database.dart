import 'package:hive_flutter/hive_flutter.dart';

class WidgetDataBase {
  List widgetList = [];

//reference the box
  final _myBox = Hive.box('mybox');

  void createInitailData() {
    widgetList = [1, 3];
  }

  void loadData() {
    widgetList = _myBox.get("WIDGETLIST");
  }

  void updateData() {
    _myBox.put("WIDGETLIST", widgetList);
  }
}

class CounterWidgetDataBase {
  late int counterNumber;

//reference the box
  final _myBox = Hive.box('mybox');

  void createInitailData() {
    counterNumber = 0;
  }

  void loadData() {
    counterNumber = _myBox.get("COUNTERNUMBER");
  }

  void updateData() {
    _myBox.put("COUNTERNUMBER", counterNumber);
  }
}
