import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import '../global_store/state.dart';
import '../todo_list_page/todo_component/component.dart';

class TodoEditState implements GlobalBaseState, Cloneable<TodoEditState> {
  ToDoState toDo;

  TextEditingController nameEditController;
  TextEditingController descEditController;

  FocusNode focusNodeName;
  FocusNode focusNodeDesc;

  @override
  Color themeColor;

  ///这里是clone
  @override
  TodoEditState clone() {
    return TodoEditState()
      ..nameEditController = nameEditController
      ..descEditController = descEditController
      ..focusNodeName = focusNodeName
      ..focusNodeDesc = focusNodeDesc
      ..toDo = toDo
      ..themeColor = themeColor;
  }
}


///TextEditingController相关的等需要在这里初始化
///ToDoState：传过来的数据
TodoEditState initState(ToDoState arg) {
  final TodoEditState state = TodoEditState();
  ///需要使用clone
  state.toDo = arg?.clone() ?? ToDoState();
  state.nameEditController = TextEditingController(text: arg?.title);
  state.descEditController = TextEditingController(text: arg?.desc);
  state.focusNodeName = FocusNode();
  state.focusNodeDesc = FocusNode();

  return state;
}
