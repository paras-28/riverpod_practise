import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/services/rest_service.dart';

final apiController = ChangeNotifierProvider((ref) => ApiNotifier());

class ApiNotifier extends ChangeNotifier {
FakeWeatherClient fakeWeatherClient = FakeWeatherClient();

Future<int> getApiData()async
{
  return await fakeWeatherClient.get("Ambala");
}

}