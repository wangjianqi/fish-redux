import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

///todoList页面
///事件和回调通过dispatch发出意图
Widget buildView(PageState state, Dispatch dispatch, ViewService viewService) {
  ///viewService：三个能力
  ///获取build-context
  ///buildView创建子组件
  ///buildAdapter创建适配器
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: const Text('ToDoList'),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          viewService.buildComponent('report'),
          Expanded(
              child: ListView.builder(
                  itemBuilder: adapter.itemBuilder,
                  itemCount: adapter.itemCount))
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(PageActionCreator.onAddAction()),
      tooltip: 'Add',
      child: const Icon(Icons.add),
    ),
  );
}
