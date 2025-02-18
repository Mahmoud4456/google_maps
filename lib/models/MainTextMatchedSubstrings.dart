/// length : 4
/// offset : 0

class MainTextMatchedSubstrings {
  MainTextMatchedSubstrings({
      this.length, 
      this.offset,});

  MainTextMatchedSubstrings.fromJson(dynamic json) {
    length = json['length'];
    offset = json['offset'];
  }
  num? length;
  num? offset;
MainTextMatchedSubstrings copyWith({  num? length,
  num? offset,
}) => MainTextMatchedSubstrings(  length: length ?? this.length,
  offset: offset ?? this.offset,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['offset'] = offset;
    return map;
  }

}