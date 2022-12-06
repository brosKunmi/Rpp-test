import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pic_app/services/client/pic_client.dart';
import 'package:pic_app/services/models/pics_model.dart';

class PicsService {
  late Dio _dio;
  late PicsClient _client;

  PicsService() {
    _dio = getDi0();
    _client = PicsClient(_dio);
  }

  Dio getDi0() {
    Dio dio = Dio(BaseOptions(connectTimeout: 30000));

    return dio;
  }

  Future<List<PicsModel>> getModel() async {
    List<PicsModel> loadedpics = [];

    var resp = await _client
        .getPics('563492ad6f91700001000001218cf6c70eec418aa26d55c88409f759');

    List picsList = resp['photos'];

    print(picsList);

    loadedpics = List.from(picsList.map((key) => PicsModel.fromMap(key)));

    print(loadedpics);

    return loadedpics;
  }
}
