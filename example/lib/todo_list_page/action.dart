import 'package:fish_redux/fish_redux.dart';
import 'todo_component/component.dart';

enum PageAction { initToDos, onAdd }

///ActionCreator
///当前页面有两个事件：初始化和添加
class PageActionCreator {
  static Action initToDosAction(List<ToDoState> toDos) {
    ///action包含type和payload
    return Action(PageAction.initToDos, payload: toDos);
  }

  ///添加
  static Action onAddAction() {
    return const Action(PageAction.onAdd);
  }
}
