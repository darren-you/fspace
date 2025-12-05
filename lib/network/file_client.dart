import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fspace/base/base.dart';
import 'package:retrofit/retrofit.dart';

part 'file_client.g.dart';

@RestApi()
abstract class FileClient {
  factory FileClient(Dio dio, {String? baseUrl}) = _FileClient;

  /// 文件上传
  @POST('/api/upload')
  Future<BaseResponse<List<String>>> uploadFile(
    @Part() List<File> files,
  );
}
