import 'package:hive/hive.dart';
import 'my_cart_model.dart';
import 'my_cart_items_model.dart';

class MyCartModelAdapter extends TypeAdapter<MyCartModel> {
  @override
  final int typeId = 7;

  @override
  MyCartModel read(BinaryReader reader) {
    final cartItems = reader.readList().cast<MyCartItemsModel>();
    final subTotal = reader.readInt();
    final vat = reader.readInt();
    final shippingFee = reader.readInt();
    final total = reader.readInt();

    return MyCartModel(
      cartItems: cartItems,
      subTotal: subTotal,
      vat: vat,
      shippingFee: shippingFee,
      total: total,
    );
  }

  @override
  void write(BinaryWriter writer, MyCartModel obj) {
    writer.writeList(obj.cartItems);
    writer.writeInt(obj.subTotal);
    writer.writeInt(obj.vat);
    writer.writeInt(obj.shippingFee);
    writer.writeInt(obj.total);
  }
}
