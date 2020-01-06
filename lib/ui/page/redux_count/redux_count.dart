import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
// https://github.com/brianegan/flutter_redux/blob/master/example/counter/lib/main.dart

enum Actions { Increment }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}

class ReduxCounter extends StatelessWidget {
  final Store<int> store = Store<int>(counterReducer, initialState: 0);
  final String title;

  ReduxCounter({Key key, this.title = 'Flutter Redux Demo'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                // StoreConnector 将store 转换为viewmodel
                StoreConnector<int, String>(
                  // 通过 converter 将 store 中的int值 返回
                  converter: (store) => store.state.toString(),
                  builder: (context, count) {
                    return Text(
                      count,
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: StoreConnector<int, VoidCallback>(
            // convert是一个函数 传递store
            converter: (store) {
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                // Attach the `callback` to the `onPressed` attribute
                onPressed: callback,
                tooltip: 'void call back',
                child: Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}
