import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'skeleton_event.dart';
part 'skeleton_state.dart';

class SkeletonBloc extends Bloc<SkeletonEvent, SkeletonState> {
  SkeletonBloc() : super(const SkeletonInitial(page: 0)) {
    on<ChangePageEvent>((event, emit) {
      emit(const SkeletonPageChanged(page: 1));
    });
  }
}
