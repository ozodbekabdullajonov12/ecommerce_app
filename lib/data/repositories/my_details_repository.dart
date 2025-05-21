import 'package:store/core/client.dart';
import 'package:store/data/models/my_cart/my_details_model.dart';

class MyDetailsRepository{
  final ApiClient client;
  MyDetailsModel? myDetails;

  MyDetailsRepository({required this.client});

  Future<MyDetailsModel> fetchMyDetails() async{
    var rawDetails = await client.fetchMyDetails();
    myDetails = MyDetailsModel.fromJson(rawDetails);
    return myDetails!;
  }
}