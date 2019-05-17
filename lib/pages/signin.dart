import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/bloc/bloc.dart';
import 'package:provider_example/provider/value_notify.dart';

class SignInPage extends StatelessWidget {

  SignInPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    Bloc  bloc = Provider.of<Bloc>(context);
    return StreamBuilder<int>(
        stream: bloc.stream,
        builder: (context, AsyncSnapshot snapshot) {
          debugPrint(snapshot.connectionState.index.toString());
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: makeBody(context, snapshot),
          );
        });
  }

  Center makeBody(BuildContext context, AsyncSnapshot snapshot) {
    ValueNotify notify =
        Provider.of<ValueNotify>(context); // find Object in the provider
    Bloc bloc = Provider.of<Bloc>(context);

    int value = notify.getValue();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$value',
            style: Theme.of(context).textTheme.display1,
          ),

          Text(
            '${snapshot.data.toString()}',
            style: Theme.of(context).textTheme.display1,
          ),

          // to trigger ChangeNotify
          RaisedButton(
            child: Text("+ ChangeNotifierProvider"),
            onPressed: () {
              notify.setValue(notify.value + 1);
            },
          ),

          // to trigger Bloc
          RaisedButton(
            child: Text("+ StreamBuilder"),
            onPressed: () {
              bloc.update(snapshot.data + 1);
            },
          )
        ],
      ),
    );
  }
}
