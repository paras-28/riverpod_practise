import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/bloc/api_notifier.dart';
import 'package:riverpod_practise/bloc/counter_notifier.dart';
import 'package:riverpod_practise/bloc/future_provider.dart';
import 'package:riverpod_practise/services/rest_service.dart';
import 'package:riverpod_practise/ui/homepage_counter.dart';

class FutureProviderApiUI extends StatefulWidget {
  FutureProviderApiUI({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FutureProviderApiUI> {
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("future provider Api integration"),
      ),
      body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 100.0,
            width: 200.0,
            color: Colors.blue[200],
            child:  Consumer(
              builder: (context, watch, child) {
                final controller = watch(responseProvider ("Texus"));
                return controller.map(
                  data: (weather) => Text('${weather.value}'),
                  loading: (_) => CircularProgressIndicator(),
                  error: (message) => Text(message.error.toString()),
                );
              },
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CounterUI(title: 'ahfjk',)));
        },

        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

    );
  }


}