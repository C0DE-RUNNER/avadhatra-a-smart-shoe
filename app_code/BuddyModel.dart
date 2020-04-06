class BuddyModel{
  String mob1;
  String name1;
  String name2;
  String mob2;

  BuddyModel({
    this.mob1,this.name1,this.name2,this.mob2,
  });

  static BuddyModel fromJson(Map<String,dynamic> json){
    return BuddyModel(
      mob1: json['mob1'],
      name1: json['name1'],
      name2: json['name2'],
      mob2: json['mob2'],
    );
  }

  Map<String, dynamic> toJson() => {
    'mob1': mob1,
    'name1': name1,
    'name2': name2,
    'mob2': mob2,
  };
}