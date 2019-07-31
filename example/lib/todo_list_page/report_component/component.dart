import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

export 'state.dart';

///todoList的header组件
class ReportComponent extends Component<ReportState> {
  ReportComponent()
      : super(
          view: buildView,
        );
}
