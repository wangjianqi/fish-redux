import 'package:fish_redux/fish_redux.dart';
import '../todo_component/component.dart';

enum ToDoListAction { add }

class ToDoListActionCreator {
  ///带参数
  static Action add(ToDoState state) {
    return Action(ToDoListAction.add, payload: state);
  }
}
