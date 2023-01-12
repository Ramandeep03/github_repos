class User {
  final String? name;
  final String? avatarURL;
  final String? profileURL;

  User({
    this.name,
    this.avatarURL,
    this.profileURL,
  });

  factory User.fromMap(Map<String,dynamic> map){
    return User(
      name: map['login'] ?? '',
      avatarURL: map['avatar_url'] ?? '',
      profileURL: map['html_url'] ?? '',
    );
  }
}
