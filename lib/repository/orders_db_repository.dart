import 'package:coffe_shop_project/Mongo/mongo_server.dart';
import 'package:coffe_shop_project/models/order_model.dart';

class OrdersDbRepository {
  Future<void> addOrder(OrderModel model) async {
    var result = {
      'product_id': model.product.id,
      'quantity': model.orderAmount,
    };
    await MongoServer.addOrder(result);
  }

  Future<void> incrementQuantity(OrderModel model) async {
    await MongoServer.modifyOrderQuantity(model.product.id!, 1);
  }

  Future<void> decrementQuantity(OrderModel model) async {
    await MongoServer.modifyOrderQuantity(model.product.id!, -1);
  }

  Future<void> deleteOrder(OrderModel model) async {
    await MongoServer.deleteOrder(model.product.id!);
  }

  Future<bool> clearDatabase() async {
    return await MongoServer.clearData();
  }
}
