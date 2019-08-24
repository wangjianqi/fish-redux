import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ToDoState> buildReducer() {
  return asReducer(<Object, Reducer<ToDoState>>{
    ToDoAction.edit: _edit,
    ToDoAction.done: _markDone
  });
}

ToDoState _edit(ToDoState state, Action action) {
  final ToDoState toDo = action.payload;
  if (state.uniqueId == toDo.uniqueId) {
    return state.clone()
      ..title = toDo.title
      ..desc = toDo.desc;
  }
  return state;
}

///完成：选中
ToDoState _markDone(ToDoState state, Action action) {
  final String uniqueId = action.payload;
  if (state.uniqueId == uniqueId) {
    ///修改数据
    return state.clone()..isDone = !state.isDone;
  }
  return state;
}
