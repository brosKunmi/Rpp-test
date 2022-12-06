part of 'pics_cubit.dart';

enum PicsStatus { loading, success, error, init }

@immutable
class PicsState {
  PicsState({this.status = PicsStatus.init, List<PicsModel>? pics})
      : pics = pics ?? [];

  final PicsStatus status;
  final List<PicsModel> pics;

  PicsState copyWith({PicsStatus? status, List<PicsModel>? pics}) => PicsState(
        pics: pics ?? this.pics,
        status: status ?? this.status,
      );
}
