class Album{
  String RFID;
  String weight;

  Album({this.RFID, this.weight});

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
      RFID: json['S'] as String,
      weight: json['N'] as String,
    );
  }
}

