import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

enum ToDoAction { onEdit, edit, done, onRemove, remove }

class ToDoActionCreator {
  ///编辑
  static Action onEditAction(String uniqueId) {
    return Action(ToDoAction.onEdit, payload: uniqueId);
  }

  static Action editAction(ToDoState toDo) {
    return Action(ToDoAction.edit, payload: toDo);
  }

  ///是否完成
  static Action doneAction(String uniqueId) {
    return Action(ToDoAction.done, payload: uniqueId);
  }

  ///删除
  static Action onRemoveAction(String uniqueId) {
    return Action(ToDoAction.onRemove, payload: uniqueId);
  }

  ///执行删除
  static Action removeAction(String uniqueId) {
    return Action(ToDoAction.remove, payload: uniqueId);
  }
}
