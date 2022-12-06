import 'package:dio/dio.dart';
import 'package:pic_app/cubit/pics_cubit.dart';
import 'package:pic_app/services/models/pics_model.dart';
import 'package:retrofit/retrofit.dart';

part 'pic_client.g.dart';

@RestApi(baseUrl: 'https://api.pexels.com/v1/search?query=people')
abstract class PicsClient {
  factory PicsClient(Dio dio, {String baseUrl}) = _PicsClient;

  @GET('')
  Future<dynamic> getPics(@Header('Authorization') token);
}
