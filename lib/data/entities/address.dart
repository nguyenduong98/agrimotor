part of 'entities.dart';

class ShippingMethod {
  ShippingMethod._();

  static const mart = 'mart';
}

class AddressType {
  AddressType._();
  static const home = 'home';
  static const apartment = 'apartment';
  static const office = 'office';
  static const hotel = 'hotel';
  static const resort = 'resort';
  static const others = 'others';
}

class MartAddress extends Equatable {
  final int? id;
  final int? customerId;
  final int? regionId;
  final Region? region;
  final String? countryId;
  final List<String>? street;
  final String? postcode;
  final String? city;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? telephone;
  final bool? defaultBilling;
  final bool? defaultShipping;
  final bool? currentShipping;
  final AddressExtAttributes? extAttrs;

  String? get preferStoreCode => extAttrs?.preferStoreCode;
  String get formattedAddress => [
        ...(street ?? []),
        if (extAttrs?.latitude == null && extAttrs?.longitude == null) ...[
          if (extAttrs?.ward != null) extAttrs!.ward,
          if (extAttrs?.district != null) extAttrs!.district,
          if (region?.name != null) region!.name,
        ],
      ].join(', ');

  const MartAddress({
    this.id,
    this.regionId,
    this.region,
    this.countryId,
    this.street,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.customerId,
    this.email,
    this.telephone,
    this.defaultBilling,
    this.defaultShipping,
    this.currentShipping,
    this.extAttrs,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{
      'id': id,
      'region_id': regionId,
      'region': region?.toJson(),
      'country_id': countryId,
      'street': street,
      'postcode': postcode,
      'city': city,
      'firstname': firstname,
      'lastname': lastname,
      'customer_id': customerId,
      'email': email,
      'telephone': telephone?.standardizedPhone,
      'default_billing': defaultBilling,
      'default_shipping': defaultShipping,
      'current_shipping': currentShipping,
      'extension_attributes': extAttrs?.toJson(),
    };
    result.removeWhere((key, value) => value == null);
    return result;
  }

  Map<String, dynamic> toRequestJson() {
    final result = <String, dynamic>{
      'customer_address_id': id,
      'region_id': regionId,
      'region': region?.name,
      'country_id': countryId,
      'street': street,
      'postcode': postcode,
      'city': city,
      'firstname': firstname,
      'lastname': lastname,
      'customer_id': customerId,
      'email': email,
      'telephone': telephone?.standardizedPhone,
      'custom_attributes': [
        {
          'attribute_code': 'recipient_name',
          'value': extAttrs?.fullname,
        },
        {
          'attribute_code': 'recipient_phone',
          'value': telephone?.standardizedPhone,
        },
        {
          'attribute_code': 'other_contact_type',
          'value': extAttrs?.ortherContactType
        },
        {
          'attribute_code': 'other_contact_option',
          'value': extAttrs?.ortherContactOption
        },
        {
          'attribute_code': 'district',
          'value': extAttrs?.district,
        },
        {
          'attribute_code': 'district_id',
          'value': extAttrs?.districtId,
        },
        {
          'attribute_code': 'ward',
          'value': extAttrs?.ward,
        },
        {
          'attribute_code': 'ward_id',
          'value': extAttrs?.wardId,
        },
        {
          'attribute_code': 'latitude',
          'value': extAttrs!.latitude?.toString(),
        },
        {
          'attribute_code': 'longitude',
          'value': extAttrs!.longitude?.toString(),
        },
        {
          'attribute_code': 'shipping_address_type',
          'value': extAttrs!.shippingAddressType
        },
        {
          'attribute_code': 'address_distance',
          'value': 0.0,
        },
        {
          'attribute_code': 'prefer_store_code',
          'value': extAttrs!.preferStoreCode,
        },
        {
          'attribute_code': 'delivery_note',
          'value': extAttrs!.deliveryNote,
        }
      ],
    };
    result.removeWhere((key, value) => value == null);
    return result;
  }

  factory MartAddress.fromJson(Map<String, dynamic> map) {
    return MartAddress(
      id: DynamicParser.parseInt(map['id']),
      regionId: DynamicParser.parseInt(map['region_id']),
      region: map['region'] != null ? Region.fromJson(map['region']) : null,
      countryId: map['country_id'],
      street: map['street']?.cast<String>(),
      postcode: map['postcode'],
      city: map['city'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      customerId: DynamicParser.parseInt(map['customer_id']),
      email: map['email'],
      telephone: map['telephone'],
      defaultBilling: map['default_billing'],
      defaultShipping: map['default_shipping'],
      currentShipping: map['default_shipping'],
      extAttrs: map['extension_attributes'] != null
          ? AddressExtAttributes.fromJson(map['extension_attributes'])
          : null,
    );
  }

  factory MartAddress.fromOrderDetailsJson(Map<String, dynamic> map) {
    return MartAddress(
      id: DynamicParser.parseInt(map['id']),
      regionId: DynamicParser.parseInt(map['region_id']),
      countryId: map['country_id'],
      street: map['street']?.cast<String>(),
      postcode: map['postcode'],
      city: map['city'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      customerId: DynamicParser.parseInt(map['customer_id']),
      email: map['email'],
      telephone: map['telephone'],
      defaultBilling: map['default_billing'],
      defaultShipping: map['default_shipping'],
      currentShipping: map['default_shipping'],
      extAttrs: map['extension_attributes'] != null
          ? AddressExtAttributes.fromJson(map['extension_attributes'])
          : null,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      regionId,
      countryId,
      street,
      postcode,
      city,
      firstname,
      lastname,
      customerId,
      email,
      telephone,
      defaultBilling,
      defaultShipping,
      extAttrs,
    ];
  }

  MartAddress copyWith({
    int? id,
    int? customerId,
    int? regionId,
    Region? region,
    String? countryId,
    List<String>? street,
    String? postcode,
    String? city,
    String? firstname,
    String? lastname,
    String? email,
    String? telephone,
    bool? defaultBilling,
    bool? defaultShipping,
    bool? currentShipping,
    AddressExtAttributes? extAttrs,
  }) {
    return MartAddress(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      regionId: regionId ?? this.regionId,
      region: region ?? this.region,
      countryId: countryId ?? this.countryId,
      street: street ?? this.street,
      postcode: postcode ?? this.postcode,
      city: city ?? this.city,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      defaultBilling: defaultBilling ?? this.defaultBilling,
      defaultShipping: defaultShipping ?? this.defaultShipping,
      currentShipping: currentShipping ?? this.currentShipping,
      extAttrs: extAttrs ?? this.extAttrs,
    );
  }
}

class AddressExtAttributes extends Equatable {
  const AddressExtAttributes({
    this.district,
    this.districtId,
    this.ward,
    this.wardId,
    this.fullname,
    this.preferStoreCode,
    this.shippingAddressType,
    this.deliveryNote,
    this.latitude,
    this.longitude,
    this.ortherContactType,
    this.ortherContactOption,
  });

  final int? districtId;
  final String? district;
  final int? wardId;
  final String? ward;
  final String? fullname;
  final String? shippingAddressType;
  final String? preferStoreCode;
  final String? deliveryNote;
  final double? latitude;
  final double? longitude;
  final String? ortherContactType;
  final String? ortherContactOption;

  Map<String, dynamic> toJson() {
    final result = {
      'district': district,
      'district_id': districtId,
      'ward': ward,
      'ward_id': wardId,
      'full_name': fullname,
      'shipping_address_type': shippingAddressType,
      'prefer_store_code': preferStoreCode,
      'delivery_note': deliveryNote,
      'latitude': latitude,
      'longitude': longitude,
      'other_contact_type': ortherContactType,
      'other_contact_option': ortherContactOption,
    };
    result.removeWhere((key, value) => value == null);
    return result;
  }

  factory AddressExtAttributes.fromJson(Map<String, dynamic> json) {
    return AddressExtAttributes(
      district: json['district'],
      districtId: DynamicParser.parseInt(json['district_id']),
      ward: json['ward'],
      wardId: DynamicParser.parseInt(json['ward_id']),
      fullname: json['full_name'],
      shippingAddressType: json['shipping_address_type'],
      preferStoreCode: json['prefer_store_code'],
      deliveryNote: json['delivery_note'],
      latitude: DynamicParser.parseDouble(json['latitude']),
      longitude: DynamicParser.parseDouble(json['longitude']),
      ortherContactType: json['other_contact_type'],
      ortherContactOption: json['other_contact_option'],
    );
  }

  @override
  List<Object?> get props => [
        district,
        districtId,
        ward,
        wardId,
        fullname,
        shippingAddressType,
        preferStoreCode,
        deliveryNote,
        latitude,
        longitude,
        ortherContactOption,
        ortherContactType,
      ];
}
