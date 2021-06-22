
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fakeWeatherClientProvider = Provider((ref) => FakeWeatherClient());

class FakeWeatherClient {
  Future<int> get(String cityName) async {
    await Future.delayed(Duration(seconds: 2));
    return cityName == 'Texus' ? 18 : 21;
  }
}