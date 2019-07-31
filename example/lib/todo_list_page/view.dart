import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

///todoList页面
Widget buildView(PageState state, Dispatch dispatch, ViewService viewService) {
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
