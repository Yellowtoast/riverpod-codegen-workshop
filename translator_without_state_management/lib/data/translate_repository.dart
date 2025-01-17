import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:translator_without_state_management/common/papago.dart';
import 'package:translator_without_state_management/data/papago_response.dart';

class TranslateRepository {
  final dio = Dio();
  TranslateRepository() {
    dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        request: true,
        responseBody: true,
        maxWidth: 200,
      ),
    );
  }

  Future<PapagoResponse> translate(String source) async {
    final response = await dio.request(
      "https://openapi.naver.com/v1/papago/n2mt?source=ko&target=en&text=$source",
      options: Options(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        headers: {
          'X-Naver-Client-Id': papagoClientId,
          'X-Naver-Client-Secret': papagoClientSecret,
        },
      ),
    );
    return PapagoResponse.fromJson(response.data!);
  }
}
