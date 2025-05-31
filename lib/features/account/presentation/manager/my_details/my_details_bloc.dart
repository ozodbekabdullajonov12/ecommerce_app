import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store/data/repositories/my_details_repository.dart';
import 'package:store/features/account/presentation/manager/my_details/my_details_state.dart';
import 'package:store/features/product_details/presentation/manager/product_details_bloc.dart';

import '../../../../auth/presentation/manager/sign_up/sign_up_state.dart';
part 'my_details_event.dart';

class MyDetailsBloc extends Bloc<MyDetailsEvent, MyDetailsState> {
  final MyDetailsRepository _repo;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MyDetailsBloc({required MyDetailsRepository repo}) : _repo = repo,
  super(MyDetailsState.initial()){
    on<MyDetailsLoad>(_onLoad);


    // on<FullNameValidationFailed>((event, emit) {
    //   emit(state.copyWith(
    //     fullNameStatus: TextFormFieldStatus.error,
    //     fullNameSuffix: "validation_error.svg",
    //   ));
    // });
}


  Future<void> _onLoad(MyDetailsLoad event, Emitter<MyDetailsState> emit )async{
    emit(state.copyWith(status: MyDetailsStatus.loading));
    final myDetails = await _repo.fetchMyDetails();
    emit(MyDetailsState(status: MyDetailsStatus.idle, myDetails: myDetails));
  }



}