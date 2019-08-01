import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'report_component/component.dart';
import 'state.dart';

import 'view.dart';

///todoList page页面
///page:
///一个页面内有且仅有一个store
///Page 继承于 Component，所以它能配置所有 Component 的要素
///Page 能配置 Middleware，用于对 Redux 做 AOP 管理
///Page 必须配置一个初始化页面数据的初始化函数  initState
class ToDoListPage extends Page<PageState, Map<String, dynamic>> {
  ToDoListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          ///listView
          view: buildView,
          dependencies: Dependencies<PageState>(
              adapter: NoneConn<PageState>() + ToDoListAdapter(),
              ///插槽
              slots: <String, Dependent<PageState>>{
                ///
                'report': ReportConnector() + ReportComponent()
              }),

          /// 页面私有AOP, 如果需要
          // middleware: <Middleware<PageState>>[
          //   logMiddleware(tag: 'ToDoListPage'),
          // ],
        );
}
