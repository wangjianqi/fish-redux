import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

///TODO ----
export 'state.dart';

///todoList的header组件
class ReportComponent extends Component<ReportState> {
  ///@required：view:
  ReportComponent()
      : super(
          view: buildView,
        );
}
