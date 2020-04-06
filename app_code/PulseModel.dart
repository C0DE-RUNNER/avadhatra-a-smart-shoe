class PulseModel{
  String BPM;

  PulseModel({
    this.BPM,
  });

  static PulseModel fromJson(Map<String,dynamic> json){
    return PulseModel(
      BPM: json['BPM'],
    );
  }

  Map<String, dynamic> toJson() => {
    'BPM': BPM,
  };
}
