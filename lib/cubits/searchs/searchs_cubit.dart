import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searchs_state.dart';

class SearchsCubit extends Cubit<SearchsState> {
  SearchsCubit() : super(SearchsInitial());
}
