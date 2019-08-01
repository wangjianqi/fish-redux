import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'todo_component/component.dart';

///reducer接受处理的action以verb(动词)命名
Reducer<PageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageState>>{PageAction.initToDos: _initToDosReducer},
  );
}

///Reducer 是一个上下文无关的 pure(纯粹的) function
///接受参数：T state  和Action action
PageState _initToDosReducer(PageState state, Action action) {
  final List<ToDoState> toDos = action.payload ?? <ToDoState>[];
  ///如果要修改数据，需要创建一份新的拷贝，修改在拷贝上
  final PageState newState = state.clone();
  newState.toDos = toDos;
  return newState;
}
