import 'package:equatable/equatable.dart';
import 'package:store/data/models/my_cart/my_details_model.dart';

enum MyDetailsStatus { idle, loading, error }

class MyDetailsState extends Equatable {
  final MyDetailsModel? myDetails;
  final MyDetailsStatus? status;

  const MyDetailsState({required this.myDetails, required this.status});

  factory MyDetailsState.initial() {
    return MyDetailsState(myDetails: null, status: MyDetailsStatus.loading);
  }

  MyDetailsState copyWith({
    MyDetailsModel? myDetails,
    MyDetailsStatus? status
  })
  {
    return MyDetailsState(
        myDetails: myDetails ?? this.myDetails,
        status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
