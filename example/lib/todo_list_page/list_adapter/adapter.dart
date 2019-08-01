import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../todo_component/component.dart';
import 'reducer.dart';

///adapter:
///DynamicFlowAdapter:
///模板是一个map，接收一个数组类型的数据驱动
class ToDoListAdapter extends DynamicFlowAdapter<PageState> {
  ToDoListAdapter()
      : super(
          pool: <String, Component<Object>>{
            ///cell
            'toDo': ToDoComponent(),
          },
          connector: _ToDoListConnector(),
          reducer: buildReducer(),
        );
}

///它表达了如何从一个大数据中读取小数据，同时对小数据的修改如何同步给大数据，这样的数据连接关系
///connector
class _ToDoListConnector extends ConnOp<PageState, List<ItemBean>> {
  ///get
  @override
  List<ItemBean> get(PageState state) {
    if (state.toDos?.isNotEmpty == true) {
      return state.toDos
          .map<ItemBean>((ToDoState data) => ItemBean('toDo', data))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  ///set
  @override
  void set(PageState state, List<ItemBean> toDos) {
    if (toDos?.isNotEmpty == true) {
      state.toDos = List<ToDoState>.from(
          toDos.map<ToDoState>((ItemBean bean) => bean.data).toList());
    } else {
      state.toDos = <ToDoState>[];
    }
  }
}





















