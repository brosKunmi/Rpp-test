import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pic_app/services/models/pics_model.dart';
import 'package:pic_app/services/repo/pics_repo.dart';

part 'pics_state.dart';

class PicsCubit extends Cubit<PicsState> {
  PicsCubit() : super(PicsState());

  final _repo = PicsRepo();

  void getAllPics() async {
    emit(state.copyWith(status: PicsStatus.loading));

    var resp = await _repo.getPics();

    if (resp.isNotEmpty) {
      emit(
        state.copyWith(status: PicsStatus.success, pics: resp),
      );
    } else {
      emit(state.copyWith(status: PicsStatus.error));
    }
  }
}
