class UserModel{
  String name;
  String email;
  String mob;

  UserModel({
    this.name,this.email,this.mob,
  });

  static UserModel fromJson(dynamic json){
    return UserModel(
      name: json['name'],
      email: json['email'],
      mob: json['mob'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'mob': mob,
  };
}