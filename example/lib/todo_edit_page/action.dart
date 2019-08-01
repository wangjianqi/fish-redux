import 'package:fish_redux/fish_redux.dart';

enum ToDoEditAction { update, onDone, onChangeTheme }

class ToDoEditActionCreator {
  static Action update(String name, String desc) {
    return Action(
      ToDoEditAction.update,
      payload: <String, String>{
        'name': name,
        'desc': desc,
      },
    );
  }

  ///完成
  static Action onDone() {
    return const Action(ToDoEditAction.onDone);
  }

  ///改变主题
  static Action onChangeTheme() {
    return const Action(ToDoEditAction.onChangeTheme);
  }
}
