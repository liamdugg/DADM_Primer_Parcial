class User {
  String email;
  String password;

  User({
    required this.email,
    required this.password,
  });
}

List<User> userList = [
    User(email: 'liam1@gmail.com', password: 'liam1'),
    User(email: 'liam2@gmail.com', password: 'liam2'),
    User(email: 'liam3@gmail.com', password: 'liam3'),
    User(email: 'liam4@gmail.com', password: 'liam4'),
    User(email: 'liam5@gmail.com', password: 'liam5'),
  ];