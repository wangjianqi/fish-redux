import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../todo_component/action.dart' as todo_action;
import '../todo_component/component.dart';
import 'action.dart';

Reducer<PageState> buildReducer() {
  return asReducer(<Object, Reducer<PageState>>{
    ToDoListAction.add: _add,
    ///执行真正的删除删除
    todo_action.ToDoAction.remove: _remove
  });
}

///adapter的reducer
PageState _add(PageState state, Action action) {
  final ToDoState toDo = action.payload;
  final PageState newState = state.clone();
  newState.toDos.add(toDo);
  return newState;
}

///删除
PageState _remove(PageState state, Action action) {
  final String unique = action.payload;
  final PageState newState = state.clone();
  newState.toDos.removeWhere((ToDoState state) => state.uniqueId == unique);
  return newState;
}
