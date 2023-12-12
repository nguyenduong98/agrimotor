part of 'entities.dart';

class Region extends Equatable {
  final int? id;
  final String? name;
  final List<District>? districts;
  const Region({
    this.id,
    this.name,
    this.districts,
  });

  Region copyWith({
    int? id,
    String? name,
    List<District>? districts,
  }) {
    return Region(
      id: id ?? this.id,
      name: name ?? this.name,
      districts: districts ?? this.districts,
    );
  }

  @override
  List<Object?> get props => [id, name, districts];

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{
      'region_id': id,
      'region': name,
    };
    if (districts?.isNotEmpty ?? false) {
      result['districts'] = districts?.map((x) => x.toJson()).toList();
    }
    return result;
  }

  factory Region.fromJson(Map<String, dynamic> map) {
    return Region(
      id: DynamicParser.parseInt(map['region_id']),
      name: map['region'] ?? map['region_name'],
      districts: map['districts'] != null
          ? (map['districts'] as List)
              .map((x) => District.fromMap(x as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}

class District extends Equatable {
  final int? id;
  final String? name;
  final List<Ward>? wards;
  const District({
    this.id,
    this.name,
    this.wards,
  });

  District copyWith({
    int? id,
    String? name,
    List<Ward>? wards,
  }) {
    return District(
      id: id ?? this.id,
      name: name ?? this.name,
      wards: wards ?? this.wards,
    );
  }

  @override
  List<Object?> get props => [id, name, wards];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'district_id': id,
      'district': name,
      'wards': wards?.map((x) => x.toJson()).toList(),
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: DynamicParser.parseInt(map['district_id']),
      name: map['district'] ?? map['district_name'],
      wards: map['wards'] != null
          ? List<Ward>.from(
              (map['wards'] as List)
                  .map<Ward>((x) => Ward.fromJson(x as Map<String, dynamic>)),
            )
          : null,
    );
  }
}

class Ward extends Equatable {
  final int? id;
  final String? name;
  const Ward({
    this.id,
    this.name,
  });

  Ward copyWith({
    int? id,
    String? name,
  }) {
    return Ward(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ward_id': id,
      'ward': name,
    };
  }

  factory Ward.fromJson(Map<String, dynamic> map) {
    return Ward(
      id: DynamicParser.parseInt(map['ward_id']),
      name: map['ward'] ?? map['ward_name'],
    );
  }
}
