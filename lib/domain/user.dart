class User {
  String email;
  String password;

  User({
    required this.email,
    required this.password,
  });
}

List<User> userList = [
    User(email: 'liam' , password: 'liam1'),
    User(email: 'liam2', password: 'liam2'),
    User(email: 'liam3', password: 'liam3'),
    User(email: 'liam4', password: 'liam4'),
    User(email: 'liam5', password: 'liam5'),
];