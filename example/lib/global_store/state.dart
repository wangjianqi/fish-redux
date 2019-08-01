import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState {
  ///主题色
  Color get themeColor;
  set themeColor(Color color);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;

  ///实现Cloneable
  @override
  GlobalState clone() {
    return GlobalState();
  }
}
