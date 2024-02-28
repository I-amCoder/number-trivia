part of 'skeleton_bloc.dart';

sealed class SkeletonState extends Equatable {
  const SkeletonState();

  @override
  List<Object> get props => [];
}

final class SkeletonInitial extends SkeletonState {
  final int page;
  const SkeletonInitial({required this.page});
}

final class SkeletonPageChanged extends SkeletonState {
  final int page;
  const SkeletonPageChanged({required this.page});
}
