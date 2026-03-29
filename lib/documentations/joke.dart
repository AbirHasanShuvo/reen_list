import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reen_list/documentations/model.dart';

final dio = Dio();

Future<Joke> fetchRandomJoke() async {
  final response = await dio.get<Map<String, Object?>>(
    'https://official-joke-api.appspot.com/random_joke',
  );

  return Joke.fromJson(response.data!);
}

//provider for fething data

final randomJokeProvider = FutureProvider<Joke>((ref) async {
  return fetchRandomJoke();
});
