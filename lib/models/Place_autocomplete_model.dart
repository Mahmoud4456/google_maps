import 'MatchedSubstrings.dart';
import 'StructuredFormatting.dart';
import 'Terms.dart';

/// description : "Alexanderplatz, Berlin, Germany"
/// matched_substrings : [{"length":4,"offset":0}]
/// place_id : "ChIJbygR2x5OqEcRbhbkZsMB_DA"
/// reference : "ChIJbygR2x5OqEcRbhbkZsMB_DA"
/// structured_formatting : {"main_text":"Alexanderplatz","main_text_matched_substrings":[{"length":4,"offset":0}],"secondary_text":"Berlin, Germany"}
/// terms : [{"offset":0,"value":"Alexanderplatz"},{"offset":16,"value":"Berlin"},{"offset":24,"value":"Germany"}]
/// types : ["tourist_attraction","point_of_interest","establishment"]

class PlaceAutocompleteModel {
  PlaceAutocompleteModel({
      this.description, 
      this.matchedSubstrings, 
      this.placeId, 
      this.reference, 
      this.structuredFormatting, 
      this.terms, 
      this.types,});

  PlaceAutocompleteModel.fromJson(dynamic json) {
    description = json['description'];
    if (json['matched_substrings'] != null) {
      matchedSubstrings = [];
      json['matched_substrings'].forEach((v) {
        matchedSubstrings?.add(MatchedSubstrings.fromJson(v));
      });
    }
    placeId = json['place_id'];
    reference = json['reference'];
    structuredFormatting = json['structured_formatting'] != null ? StructuredFormatting.fromJson(json['structured_formatting']) : null;
    if (json['terms'] != null) {
      terms = [];
      json['terms'].forEach((v) {
        terms?.add(Terms.fromJson(v));
      });
    }
    types = json['types'] != null ? json['types'] as List<dynamic> : [];
  }
  String? description;
  List<MatchedSubstrings>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Terms>? terms;
  List<dynamic>? types;
PlaceAutocompleteModel copyWith({  String? description,
  List<MatchedSubstrings>? matchedSubstrings,
  String? placeId,
  String? reference,
  StructuredFormatting? structuredFormatting,
  List<Terms>? terms,
  List<dynamic>? types,
}) => PlaceAutocompleteModel(  description: description ?? this.description,
  matchedSubstrings: matchedSubstrings ?? this.matchedSubstrings,
  placeId: placeId ?? this.placeId,
  reference: reference ?? this.reference,
  structuredFormatting: structuredFormatting ?? this.structuredFormatting,
  terms: terms ?? this.terms,
  types: types ?? this.types,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (matchedSubstrings != null) {
      map['matched_substrings'] = matchedSubstrings?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = placeId;
    map['reference'] = reference;
    if (structuredFormatting != null) {
      map['structured_formatting'] = structuredFormatting?.toJson();
    }
    if (terms != null) {
      map['terms'] = terms?.map((v) => v.toJson()).toList();
    }
    map['types'] = types;
    return map;
  }

}