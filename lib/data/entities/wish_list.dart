part of 'entities.dart';

class WishListModel extends Equatable {
  const WishListModel({
    this.wishlistId,
    this.customerId,
    this.isShared,
    this.sharingCode,
    this.items,
  });

  final int? wishlistId;
  final int? customerId;
  final bool? isShared;
  final String? sharingCode;
  final List<WishListItemModel>? items;

  @override
  factory WishListModel.fromJson(Map<String, dynamic> map) {
    return WishListModel(
      wishlistId: map['wishlist_id'],
      customerId: map['customer_id'],
      isShared: map['is_shared'],
      sharingCode: map['sharing_code'],
      items: map["items"] != null
          ? (map["items"] as List)
              .map((e) => WishListItemModel.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'wishlistId': wishlistId,
        'customerId': customerId,
        'isShared': isShared,
        'sharingCode': sharingCode,
        'items': items,
      };

  @override
  List<Object?> get props => [
        wishlistId,
        customerId,
        isShared,
        sharingCode,
        items,
      ];
}

class WishListItemModel extends Equatable {
  const WishListItemModel({
    this.wishlistItemId,
    this.wishlistId,
    this.productId,
    this.storeId,
    this.addedAt,
    this.productName,
    this.price,
  });

  final int? wishlistItemId;
  final int? wishlistId;
  final int? productId;
  final int? storeId;
  final String? addedAt;
  final String? productName;
  final int? price;

  @override
  factory WishListItemModel.fromJson(Map<String, dynamic> map) {
    return WishListItemModel(
      wishlistItemId: map['wishlist_item_id'],
      wishlistId: map['wishlist_id'],
      productId: map['product_id'],
      storeId: map['store_id'],
      addedAt: map['added_at'],
      productName: map['product_name'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'wishlistItemId': wishlistItemId,
        'wishlistId': wishlistId,
        'productId': productId,
        'storeId': storeId,
        'addedAt': addedAt,
        'productName': productName,
        'price': price,
      };

  @override
  List<Object?> get props => [
        wishlistId,
        wishlistId,
        productId,
        storeId,
        addedAt,
        productName,
        price,
      ];
}
