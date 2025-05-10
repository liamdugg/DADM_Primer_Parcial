class User {
  String username;
  String password;
  String email;
  String phone;
  String city;
  String country;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.city,
    required this.country,
  });
}

final List<User> userList = List.generate(10, (index) {
  final i = index + 1; // Start from 1
  return User(
    username: 'liam$i',
    password: 'contraseña', // Same password
    email   : 'liam$i@gmail.com',
    phone   : '15-6264-5759}',
    city    : 'City$i',
    country : 'Country$i',
  );
});
