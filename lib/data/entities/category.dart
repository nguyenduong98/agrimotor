part of 'entities.dart';

class Category extends Equatable {
  final int? id;
  final int? parentId;
  final String? name;
  final String? path;
  final int? level;
  final int? position;
  final String? url;
  final List<Category>? child;
  final String? thumbnailUrl;
  final String? banner;

  final int? objectId;
  final String? pathFormatted;
  final String? urlKey;
  final bool? includeInMenu;
  final int? productAttributeSetId;
  final int? attributeSetId;
  final bool? isAnchor;
  final bool? isActive;
  final String? imageUrl;
  final String? iconImageUrl;
  final String? metaTitle;
  final String? catLandingpageBanner;
  final DateTime? esLastUpdateAtHcm;

  const Category({
    this.id,
    this.parentId,
    this.name,
    this.path,
    this.level,
    this.position,
    this.url,
    this.child,
    this.thumbnailUrl,
    this.objectId,
    this.pathFormatted,
    this.urlKey,
    this.includeInMenu,
    this.productAttributeSetId,
    this.attributeSetId,
    this.isAnchor,
    this.isActive,
    this.imageUrl,
    this.iconImageUrl,
    this.metaTitle,
    this.catLandingpageBanner,
    this.esLastUpdateAtHcm,
    this.banner,
  });

  @override
  List<Object?> get props {
    return [
      id,
      parentId,
      name,
      path,
      level,
      position,
      url,
      child,
      thumbnailUrl,
      objectId,
      pathFormatted,
      urlKey,
      includeInMenu,
      productAttributeSetId,
      attributeSetId,
      isAnchor,
      isActive,
      imageUrl,
      iconImageUrl,
      metaTitle,
      catLandingpageBanner,
      esLastUpdateAtHcm,
      banner,
    ];
  }

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      id: DynamicParser.parseInt(map['id']),
      parentId: map['parent_id'],
      name: map['name'] != null ? map['name'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      level: map['level'] != null ? map['level'] as int : null,
      position: map['position'] != null ? map['position'] as int : null,
      url: map['url'] != null ? map['url'] as String : null,
      thumbnailUrl: map['thumbnail_url'],
      child: map['child'] != null
          ? (map['child'] as List).map((e) => Category.fromJson(e)).toList()
          : null,
      objectId: map["objectId"],
      pathFormatted: map["path_formatted"],
      urlKey: map["url_key"],
      includeInMenu: map["include_in_menu"],
      productAttributeSetId: map["product_attribute_set_id"],
      attributeSetId: map["attribute_set_id"],
      isAnchor: map["is_anchor"],
      isActive: map["is_active"],
      imageUrl: map["image_url"],
      iconImageUrl: map["icon_image_url"],
      metaTitle: map["meta_title"],
      catLandingpageBanner: map["cat_landingpage_banner"],
      banner: map["banner_mobile_url"],
      esLastUpdateAtHcm: map["esLastUpdateAtHCM"] == null
          ? null
          : DynamicParser.parseDate(map["esLastUpdateAtHCM"]),
    );
  }

  Category copyWith({
    int? id,
    int? parentId,
    String? name,
    String? path,
    int? level,
    int? position,
    String? url,
    List<Category>? child,
    String? thumbnailUrl,
    int? objectId,
    String? pathFormatted,
    String? urlKey,
    bool? includeInMenu,
    int? productAttributeSetId,
    int? attributeSetId,
    bool? isAnchor,
    bool? isActive,
    String? imageUrl,
    String? iconImageUrl,
    String? metaTitle,
    String? catLandingpageBanner,
    DateTime? esLastUpdateAtHcm,
    String? banner,
  }) {
    return Category(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      path: path ?? this.path,
      level: level ?? this.level,
      position: position ?? this.position,
      url: url ?? this.url,
      child: child ?? this.child,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      objectId: objectId ?? this.objectId,
      pathFormatted: pathFormatted ?? this.pathFormatted,
      urlKey: urlKey ?? this.urlKey,
      includeInMenu: includeInMenu ?? this.includeInMenu,
      productAttributeSetId:
          productAttributeSetId ?? this.productAttributeSetId,
      attributeSetId: attributeSetId ?? this.attributeSetId,
      isAnchor: isAnchor ?? this.isAnchor,
      isActive: isActive ?? this.isActive,
      imageUrl: imageUrl ?? this.imageUrl,
      iconImageUrl: iconImageUrl ?? this.iconImageUrl,
      metaTitle: metaTitle ?? this.metaTitle,
      catLandingpageBanner: catLandingpageBanner ?? this.catLandingpageBanner,
      esLastUpdateAtHcm: esLastUpdateAtHcm ?? this.esLastUpdateAtHcm,
      banner: banner ?? this.banner,
    );
  }
}

extension CategoryListExt on List<Category> {
  //
  Category? find(int? id) {
    return firstWhereOrNull((c) => c.id == id);
  }

  //
  List<Category> flat() {
    final result =
        map((c) => (c.child ?? []).flat()..add(c)).expand((e) => e).toList();
    return result;
  }

  //
  List<Category> getOptions(Category category, {bool hasParent = false}) {
    return List<Category>.from(hasParent
        ? where((c) => c.parentId == category.parentId)
        : where((c) => c.level == category.level));
  }

  List<Category> getChildren(Category category) {
    return List<Category>.from(where((c) => c.parentId == category.id));
  }
}
