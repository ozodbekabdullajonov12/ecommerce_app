import 'package:bloc/bloc.dart';
import 'package:store/data/repositories/my_cart_repository/my_cart_repositoroy.dart';
import 'package:store/features/myCart/presentation/manager/my_cart_state.dart';

part 'my_cart_event.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState>{
  final MyCartRepository _myCartRepo;

  MyCartBloc({
    required MyCartRepository myCartRepo}):
      _myCartRepo = myCartRepo,
  super(MyCartState.initial()){
    on<MyCartLoading>(_onLoad);
    add(MyCartLoading());
  }
  Future<void>_onLoad(MyCartLoading event, Emitter<MyCartState> emit)async{
    emit(state.copyWith(status: MyCartStatus.loading));
    try{
      final myCart = await _myCartRepo.fetchMyCart();
      emit(state.copyWith(myCart: myCart, status: MyCartStatus.success));
    }catch(a){
      emit(state.copyWith(status: MyCartStatus.error));
    }
  }
  
}