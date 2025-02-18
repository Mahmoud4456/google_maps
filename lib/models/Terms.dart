/// offset : 0
/// value : "Alexanderplatz"

class Terms {
  Terms({
      this.offset, 
      this.value,});

  Terms.fromJson(dynamic json) {
    offset = json['offset'];
    value = json['value'];
  }
  num? offset;
  String? value;
Terms copyWith({  num? offset,
  String? value,
}) => Terms(  offset: offset ?? this.offset,
  value: value ?? this.value,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = offset;
    map['value'] = value;
    return map;
  }

}