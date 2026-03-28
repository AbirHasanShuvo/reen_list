import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    //for just showing the value this method worked
    return Scaffold(
      body: Center(
        child: Text(
          "Value : ${value.toString()}",
          style: TextStyle(fontSize: 40),
        ),
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              //for updating the value obviously needed notifier and state also
              onPressed: () => ref.read(counterStateProvider.notifier).state++,
              child: Icon(Icons.add),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterStateProvider.notifier).state--;
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
