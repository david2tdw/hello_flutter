import 'dart:async';

import 'package:hello_flutter/redux/middleware/epic.dart';
import 'package:hello_flutter/redux/middleware/epic_store.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';


class EpicMiddleware<State> extends MiddlewareClass<State> {

  final StreamController<dynamic> _actions = new StreamController<dynamic>.broadcast();

  final StreamController<Epic<State>> _epics = new StreamController.broadcast(sync: true);

  final bool supportAsyncGenerators;
  Epic<State> _epic;
  bool _isSubscribed = false;


  EpicMiddleware(Epic<State> epic, {this.supportAsyncGenerators = true}) : _epic = epic;
  @override
  call(Store<State> store, dynamic action, NextDispatcher next) {
    if (!_isSubscribed) {
      _epics.stream.transform<dynamic>(
        new SwitchMapStreamTransformer<Epic<State>, dynamic>(
          (epic) => epic(_actions.stream, new EpicStore(store))
        )
      ).listen(store.dispatch);

      _epics.add(_epic);
      _isSubscribed = true;
    }

    next(action);

    if (supportAsyncGenerators) {
      // Future.delayed is an ugly hack to support async* functions.
      //
      // See: https://github.com/dart-lang/sdk/issues/33818
      new Future.delayed(Duration.zero, () {
        _actions.add(action);
      });
    } else {
      _actions.add(action);
    }
  }
// Gets or replaces the epic currently used by the middleware.
  Epic<State> get epic => _epic;

  set epic(Epic<State> newEpic) {
    _epic = newEpic;

    _epics.add(newEpic);
  }
}
