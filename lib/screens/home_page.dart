import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final numbersProvider = StateNotifierProvider<NumberNotifier, List<String>>((
  ref,
) {
  return NumberNotifier();
});

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['number 12', 'number 13']);

  //method for randomly generating number
  void add(String number) {
    state = [...state, number];
  }

  //for removing
  void remove(String number) {
    state = [...state.where((element) => element != number)];
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numbersProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Riverpod'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(numbersProvider.notifier)
              .add("number ${Random().nextInt(100)}");
        },
        child: Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: numbers
                .map(
                  (e) => GestureDetector(
                    onTap: (){
                      ref.read(numbersProvider.notifier).remove(e);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text(e),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
