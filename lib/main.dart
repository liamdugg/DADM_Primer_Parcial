import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primer_parcial/core/router/app_router.dart';
import 'package:primer_parcial/core/database/users_database.dart';
import 'package:primer_parcial/core/theme/app_theme_provider.dart';

late UsersDatabase usersDatabase;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  usersDatabase = await $FloorUsersDatabase.databaseBuilder('users_database.db').build();

  //for (User user in userList) {
  //  await usersDatabase.usersDao.insertUser(user);
  //}

  runApp(
    ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ref.watch(themeProvider).getTheme(),
    );
  }
}
