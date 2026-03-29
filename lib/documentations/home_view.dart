import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reen_list/documentations/joke.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke Generator'), centerTitle: true),
      body: SizedBox.expand(
        child: Consumer(
          builder: (context, ref, child) {
            final randomJoke = ref.watch(randomJokeProvider);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // const SelectableText(
                  //   'What kind of bagel can fly\n\n'
                  //   'A plain bagel.',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 24.0),
                  // ),
                  switch (randomJoke) {
                    AsyncValue(:final value?) => SelectableText(
                      '${value.setup}\n\n'
                      '${value.punchline}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24.0),
                    ),

                    // On error, we display a simple error message.
                    AsyncValue(error: != null) => const Text(
                      'Error fetching joke',
                    ),
                    // While the request is loading, we display a progress indicator.
                    AsyncValue() => const CircularProgressIndicator(),
                  },

                  Positioned(
                    bottom: 20,
                    child: ElevatedButton(
                      onPressed: ()=> ref.invalidate(randomJokeProvider),
                      child: Text('Get another joke'),
                    ),
                  ),

                  if(randomJoke.isRefreshing)
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: LinearProgressIndicator(),
                    ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
