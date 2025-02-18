/// length : 4
/// offset : 0

class MatchedSubstrings {
  MatchedSubstrings({
      this.length, 
      this.offset,});

  MatchedSubstrings.fromJson(dynamic json) {
    length = json['length'];
    offset = json['offset'];
  }
  num? length;
  num? offset;
MatchedSubstrings copyWith({  num? length,
  num? offset,
}) => MatchedSubstrings(  length: length ?? this.length,
  offset: offset ?? this.offset,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['offset'] = offset;
    return map;
  }

}