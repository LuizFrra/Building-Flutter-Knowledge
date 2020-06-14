class Finance {
  double dollar;
  double euro;
  double real;

  Finance({this.dollar, this.euro, this.real});

  factory Finance.fromJson(Map<String, dynamic> json) {
    return Finance(
      dollar: json['results']['currencies']['USD']['buy'],
      euro: json['results']['currencies']['EUR']['buy'],
    );
  }
}