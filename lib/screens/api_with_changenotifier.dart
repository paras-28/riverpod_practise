import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/bloc/api_notifier.dart';
import 'package:riverpod_practise/bloc/counter_notifier.dart';
import 'package:riverpod_practise/services/rest_service.dart';

class ApiUI extends StatefulWidget {
  ApiUI({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ApiUI> {
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Api integration"),
      ),
      body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 100.0,
            width: 200.0,
            color: Colors.blue[200],
            child:  Consumer(
              builder: (context, watch, child) {
                final controller = watch(apiController);
                return FutureBuilder<int>(
                  future: controller.getApiData(), // async work
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting: return CircularProgressIndicator(color: Colors.red
                        ,);
                      default:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else
                          return Text('Result: ${snapshot.data.toString()}');
                    }
                  },
                );
              },
            ),
          )
      ),

    );
  }


}