import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_114/core/services/api_services.dart';
import 'package:movie_114/core/services/end_points.dart';
import 'package:movie_114/features/home/models/popular_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context)=>BlocProvider.of(context);

  PopularModel? popularModel;

  Future<void>getPopular()async{
    emit(GetPopularLoadingState());
    final response= await ApiServices.getData(url: EndPoints.popular);
    if(response.statusCode==200){
      popularModel=PopularModel.fromJson(response.data);
      emit(GetPopularSuccessState());
    }else{
      print(response.data);
      emit(GetPopularErrorState());
    }
  }


}
