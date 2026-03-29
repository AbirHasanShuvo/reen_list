import 'package:flutter/material.dart';
import 'package:reen_list/model/user_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.e});

  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ),

              Text(e.firstName + " " + e.lastName),
              Text(e.email),
            ],
          ),
        ),
      ),
    );
  }
}
