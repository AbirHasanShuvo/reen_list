import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reen_list/model/user_model.dart';
import 'package:reen_list/services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.watch(userProvider).getUsers();
});
