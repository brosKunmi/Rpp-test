import 'package:pic_app/services/models/pics_model.dart';
import 'package:pic_app/services/repo/pic_service.dart';

class PicsRepo {
  PicsRepo._();

  factory PicsRepo() => PicsRepo._();

  final _picsSer = PicsService();

  Future<List<PicsModel>> getPics() async => await _picsSer.getModel();
}
