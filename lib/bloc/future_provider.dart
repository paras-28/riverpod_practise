import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/services/rest_service.dart';

final responseProvider = FutureProvider<int>((ref) async {
  final weatherClient = ref.read(fakeWeatherClientProvider);
  return weatherClient.get('Texus');
});