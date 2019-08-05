import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import '../global_store/state.dart';
import 'report_component/component.dart';
import 'todo_component/component.dart';

class PageState implements GlobalBaseState, Cloneable<PageState> {
  ///数据源
  List<ToDoState> toDos;

  ///主题颜色
  @override
  Color themeColor;

  @override
  PageState clone() {
    return PageState()
      ..toDos = toDos
      ..themeColor = themeColor;
  }
}

///初始化数据
PageState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  return PageState();
}

///combineReducers 是一个将 Reducer 分治的函数，让一个庞大数据的 Reducer 可以由多层的更小的 Reducer 组合而成
///connector
///state的clone的能力
///get&set的能力，即为connector的概念
class ReportConnector extends Reselect2<PageState, ReportState, int, int> {
  ///计算的
  @override
  ReportState computed(int sub0, int sub1) {
    return ReportState()
      ..done = sub0
      ..total = sub1;
  }

  ///report_component的数据是从这里绑定获取的
  ///注意get方法
  @override
  int getSub0(PageState state) {
    return state.toDos.where((ToDoState tds) => tds.isDone).toList().length;
  }

  @override
  int getSub1(PageState state) {
    return state.toDos.length;
  }

  @override
  void set(PageState state, ReportState subState) {
    throw Exception('Unexcepted to set PageState from ReportState');
  }
}
