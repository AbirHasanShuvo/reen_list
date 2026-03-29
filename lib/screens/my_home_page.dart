import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reen_list/data_provider/data_provider.dart';
import 'package:reen_list/model/user_model.dart';
import 'package:reen_list/screens/details_screen.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      body: _data.when(
        data: (_data) {
          List<UserModel> userList = _data.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(e: userList[index])));
                      },
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            userList[index].firstName,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            userList[index].lastName,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(
                              userList[index].avatar,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}
