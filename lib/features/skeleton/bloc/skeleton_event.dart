part of 'skeleton_bloc.dart';

sealed class SkeletonEvent extends Equatable {
  const SkeletonEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends SkeletonEvent {
  final int number;
  const ChangePageEvent({required this.number});
}
