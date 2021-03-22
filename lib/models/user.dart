class User {
  final String name;
  final String email;
  final String password;

  const User({this.name, this.email, this.password});

  const User.empty({this.name = '', this.email = '', this.password = ''});
}
