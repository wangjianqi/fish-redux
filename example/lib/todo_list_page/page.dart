import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'report_component/component.dart';
import 'state.dart';

import 'view.dart';

///todoList:page页面
///page:
///一个页面内有且仅有一个store
///Page 继承于 Component，所以它能配置所有 Component 的要素
///Page 能配置 Middleware，用于对 Redux 做 AOP 管理
///Page 必须配置一个初始化页面数据的初始化函数  initState
class ToDoListPage extends Page<PageState, Map<String, dynamic>> {
  ToDoListPage()
      : super(
          ///initState：必须的:就是一个带有参数的函数
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          ///view:必须的:函数
          view: buildView,
          ///dependencies是表达组件之间依赖关系的结构
    ///接收两个字段：slots和adapter
    ///slots组件依赖的插槽
    ///adapter：组件依赖的具体适配器（用来构建高性能的ListView）
    ///Dependent 是 subComponent | subAdapter + connector 的组合
    ///一个 组件的 Reducer 由 Component 自身配置的 Reducer 和它的 Dependencies 下的所有子 Reducers 自动复合而成。
    ///dependent：Dependent = connector<T, P> + subComponent | subAdapter 的组合，它表达了小组件|小适配器是如何连接到 Component 的。
          dependencies: Dependencies<PageState>(
              adapter: NoneConn<PageState>() + ToDoListAdapter(),
              ///插槽
              slots: <String, Dependent<PageState>>{
                ///
                'report': ReportConnector() + ReportComponent(),
              }),

          /// 页面私有AOP, 如果需要
          // middleware: <Middleware<PageState>>[
          //   logMiddleware(tag: 'ToDoListPage'),
          // ],
        );
}
