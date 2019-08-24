import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'list_adapter/action.dart' as list_action;
import 'state.dart';
import 'todo_component/component.dart';


///Effect处理Action的副作用
///用法和reducer差不多，作用完全不同
///异步请求
///
///注意：================默认情况effect会在reducer之前被执行================
///
///当前effect返回 true 的时候，就会停止后续的effect和reducer的操作
///当前effect返回 false 的时候，后续effect和reducer继续执行
///
/// effect处理所有副作用的函数，接收参数：Action action  Context context
/// Effect会接收来自 View 的“意图”，包括对应的生命周期的回调，然后做出具体的执行。
/// - 它的处理可能是一个异步函数，数据可能在过程中被修改，所以我们应该通过 context.state 获取最新数据。
/// - 如果它要修改数据，应该发一个 Action 到 Reducer 里去处理。
/// 它对数据是只读的，不能直接去修改数据。
/// - 如果它的返回值是一个非空值，则代表自己优先处理，不再做下一步的动作；否则广播给其他组件的 Effect 部分，同时发送给 Reducer

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    PageAction.onAdd: _onAdd,
  });
}

///初始话数据
///可以在这里获取网络数据
void _init(Action action, Context<PageState> ctx) {
  final List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Hello world',
      desc: 'Learn how to program.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '2',
      title: 'How Fish Redux',
      desc: 'Learn how to use Fish Redux in a flutter application.',
      isDone: false,
    )
  ];

  ctx.dispatch(PageActionCreator.initToDosAction(initToDos));
}

///effect接受处理的action以on命名
void _onAdd(Action action, Context<PageState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed('todo_edit', arguments: null)
      .then((dynamic toDo) {
    if (toDo != null &&
        (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
      ///调用adapter的action
      ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
    }
  });
}























