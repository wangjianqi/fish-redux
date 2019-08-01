import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

export 'state.dart';

///组件
class ToDoComponent extends Component<ToDoState> {
  ToDoComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
          reducer: buildReducer(),
        );
}
