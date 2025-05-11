class User {
  String username;
  String password;
  String email;
  String phone;
  String city;
  String country;
  String profileImage;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.city,
    required this.country,
    required this.profileImage,
  });
}

final List<User> userList = List.generate(10, (index) {
  final i = index + 1; // Start from 1
  return User(
    username: 'liam$i',
    password: 'contraseña',
    email   : 'liam$i@gmail.com',
    phone   : '15-6264-5759',
    city    : 'City$i',
    country : 'Country$i',
    profileImage: 'assets/messi.jpg',
  );
});
