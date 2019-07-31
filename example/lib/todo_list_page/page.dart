import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'report_component/component.dart';
import 'state.dart';

import 'view.dart';

///page页面
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
