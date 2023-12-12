part of 'entities.dart';

class OrderStatsModel extends Equatable {
  final int? totalOrder;
  final int? totalOrderNormal;
  final int? totalOrderCanceled;
  final int? totalOrderReturned;
  final int? totalOrderPlaceorder;
  final int? totalOrderPreparing;
  final int? totalOrderDelivering;
  final int? totalOrderCompleted;
  final int? totalPendingPayment;

  const OrderStatsModel({
    this.totalOrder,
    this.totalOrderNormal,
    this.totalOrderCanceled,
    this.totalOrderReturned,
    this.totalOrderPlaceorder,
    this.totalOrderPreparing,
    this.totalOrderDelivering,
    this.totalOrderCompleted,
    this.totalPendingPayment,
  });

  factory OrderStatsModel.fromJson(Map<String, dynamic> map) {
    return OrderStatsModel(
      totalOrder: DynamicParser.parseInt(map['total_order']),
      totalOrderNormal: DynamicParser.parseInt(map['total_order_normal']),
      totalOrderCanceled: DynamicParser.parseInt(map['total_order_canceled']),
      totalOrderReturned: DynamicParser.parseInt(map['total_order_returned']),
      totalOrderPlaceorder:
          DynamicParser.parseInt(map['total_order_placeorder']),
      totalOrderPreparing: DynamicParser.parseInt(map['total_preparing_order']),
      totalOrderDelivering:
          DynamicParser.parseInt(map['total_delivering_order']),
      totalOrderCompleted:
          DynamicParser.parseInt(map['total_delivery_completed_order']),
      totalPendingPayment:
          DynamicParser.parseInt(map['total_payment_pending_order']),
    );
  }

  @override
  List<Object?> get props {
    return [
      totalOrder,
      totalOrderNormal,
      totalOrderCanceled,
      totalOrderReturned,
      totalOrderPlaceorder,
      totalOrderPreparing,
      totalOrderDelivering,
      totalOrderCompleted,
      totalPendingPayment,
    ];
  }
}
