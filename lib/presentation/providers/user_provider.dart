import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primer_parcial/domain/user.dart';

final loggedUserProvider = StateNotifierProvider<ThemeNotifier, User>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<User> {

  ThemeNotifier() : super(User(username:'', password:'', email:'', phone:'', city:'', country:''));

  void setUser(String username, String password) {
    state = User(
      username: username, 
      password: password,
      email   : '',
      phone   : '',
      city    : '',
      country : '',
    );
  }
}