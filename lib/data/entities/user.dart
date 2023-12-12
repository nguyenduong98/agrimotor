part of 'entities.dart';

class MartUser extends Equatable {
  final int? id;
  final int? groupId;
  final int? defaultBilling;
  final int? defaultShipping;
  final DateTime? dob;
  final String? email;
  final String? firstName;
  final String? lastName;
  final int? gender;
  final int? storeId;
  final List<MartAddress>? addresses;
  final List<UserCustomAttribute>? customAttributes;

  String? get phoneNumber => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'phone_number')
      ?.value;

  String? get fullName => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'full_name')
      ?.value;

  String? get nationality => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'nationality')
      ?.value;

  String? get avatar => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'profile_picture')
      ?.value;

  double? get points => DynamicParser.parseDouble(customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'membership_points')
      ?.value);

  String? get numberCard => customAttributes
      ?.firstWhereOrNull(
          (a) => a.attributeCode == 'customer_lpoint_card_number')
      ?.value;

  String? get customerStatus => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'customer_status')
      ?.value;

  String? get idNumberOrPassortNumber => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'id_number_passport_number')
      ?.value;

  String? get otherContactOption => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'other_contact_option')
      ?.value;

  String? get otherContactType => customAttributes
      ?.firstWhereOrNull((a) => a.attributeCode == 'other_contact_type')
      ?.value;

  bool get isQuickSignUp {
    final value = DynamicParser.parseInt(customAttributes
        ?.firstWhereOrNull((a) => a.attributeCode == 'is_quick_signup')
        ?.value);
    return value == 1;
  }

  List<MartAddress>? get sortedAddresses =>
      addresses?.sortedBy<num>((e) => e.id!).toList();

  const MartUser({
    this.id,
    this.groupId,
    this.defaultBilling,
    this.defaultShipping,
    this.dob,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.storeId,
    this.addresses,
    this.customAttributes,
  });

  @override
  List<Object?> get props {
    return [
      id,
      groupId,
      defaultBilling,
      defaultShipping,
      dob,
      email,
      firstName,
      lastName,
      gender,
      storeId,
      addresses,
      customAttributes,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'groupId': groupId,
      'default_billing': defaultBilling,
      'default_shipping': defaultShipping,
      'dob': dob?.millisecondsSinceEpoch,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'gender': gender,
      'storeId': storeId,
      'addresses': addresses?.map((x) => x.toJson()).toList(),
      'custom_attributes': customAttributes?.map((e) => e.toJson()).toList(),
    };
  }

  factory MartUser.fromJson(Map<String, dynamic> map) {
    return MartUser(
      id: DynamicParser.parseInt(map['id']),
      groupId: DynamicParser.parseInt(map['group_id']),
      defaultBilling: DynamicParser.parseInt(map['default_billing']),
      defaultShipping: DynamicParser.parseInt(map['default_shipping']),
      dob: map['dob'] != null ? DateTimeUtil.tryParse(map['dob']) : null,
      email: map['email'],
      firstName: map['firstname'],
      lastName: map['lastname'],
      gender: DynamicParser.parseInt(map['gender']),
      storeId: DynamicParser.parseInt(map['store_id']),
      addresses: map['addresses'] != null
          ? List<MartAddress>.from(
              (map['addresses'] as List).map<MartAddress?>(
                (x) => MartAddress.fromJson(x),
              ),
            )
          : null,
      customAttributes: map['custom_attributes'] != null
          ? List<UserCustomAttribute>.from(
              (map['custom_attributes'] as List).map<UserCustomAttribute?>(
                (x) => UserCustomAttribute.fromJson(x),
              ),
            )
          : null,
    );
  }

  MartUser copyWith({
    int? id,
    int? groupId,
    int? defaultBilling,
    int? defaultShipping,
    DateTime? dob,
    String? email,
    String? firstName,
    String? lastName,
    int? gender,
    int? storeId,
    List<MartAddress>? addresses,
    List<UserCustomAttribute>? customAttributes,
  }) {
    return MartUser(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      defaultBilling: defaultBilling ?? this.defaultBilling,
      defaultShipping: defaultShipping ?? this.defaultShipping,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      storeId: storeId ?? this.storeId,
      addresses: addresses ?? this.addresses,
      customAttributes: customAttributes ?? this.customAttributes,
    );
  }
}

class UserCustomAttribute {
  final String? attributeCode;
  final dynamic value;

  UserCustomAttribute({
    this.attributeCode,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'attribute_code': attributeCode,
      'value': value,
    };
  }

  factory UserCustomAttribute.fromJson(Map<String, dynamic> map) {
    return UserCustomAttribute(
      attributeCode: map['attribute_code'],
      value: map['value'],
    );
  }
}
