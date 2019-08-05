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
///typedef Reducer<T> = T Function(T state, Action action);
///
///接收一个意图，做出数据修改
///如果数据修改了，它会自动触发 State 的层层数据的拷贝，再以扁平化方式通知组件刷新。
PageState _initToDosReducer(PageState state, Action action) {
  final List<ToDoState> toDos = action.payload ?? <ToDoState>[];
  ///如果要修改数据，需要创建一份新的拷贝，修改在拷贝上
  final PageState newState = state.clone();
  newState.toDos = toDos;
  return newState;
}
