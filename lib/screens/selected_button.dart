import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final isRedProvider = Provider<bool>((ref) => true);
final selectedButtonProvider = StateProvider<String>((ref) => "No color");

class SelectedButton extends ConsumerWidget {
  const SelectedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = 'red',
              child: Text('Red'),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = 'blue',
              child: Text('Blue'),
            ),
            
            const SizedBox(height: 10,),
            Text(ref.watch(selectedButtonProvider))
          ],
        ),
      ),
    );
  }
}
