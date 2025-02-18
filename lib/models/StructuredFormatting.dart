import 'MainTextMatchedSubstrings.dart';

/// main_text : "Alexanderplatz"
/// main_text_matched_substrings : [{"length":4,"offset":0}]
/// secondary_text : "Berlin, Germany"

class StructuredFormatting {
  StructuredFormatting({
      this.mainText, 
      this.mainTextMatchedSubstrings, 
      this.secondaryText,});

  StructuredFormatting.fromJson(dynamic json) {
    mainText = json['main_text'];
    if (json['main_text_matched_substrings'] != null) {
      mainTextMatchedSubstrings = [];
      json['main_text_matched_substrings'].forEach((v) {
        mainTextMatchedSubstrings?.add(MainTextMatchedSubstrings.fromJson(v));
      });
    }
    secondaryText = json['secondary_text'];
  }
  String? mainText;
  List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings;
  String? secondaryText;
StructuredFormatting copyWith({  String? mainText,
  List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings,
  String? secondaryText,
}) => StructuredFormatting(  mainText: mainText ?? this.mainText,
  mainTextMatchedSubstrings: mainTextMatchedSubstrings ?? this.mainTextMatchedSubstrings,
  secondaryText: secondaryText ?? this.secondaryText,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main_text'] = mainText;
    if (mainTextMatchedSubstrings != null) {
      map['main_text_matched_substrings'] = mainTextMatchedSubstrings?.map((v) => v.toJson()).toList();
    }
    map['secondary_text'] = secondaryText;
    return map;
  }

}