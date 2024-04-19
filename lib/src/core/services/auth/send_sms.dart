
import 'package:barcodbek/src/data/entity/send_sms_model.dart';
import 'package:dio/dio.dart';

class SendMessage {
  static const baseUrl = 'https://notify.eskiz.uz/api/message/sms/send';
  static Dio dio = Dio();

  static postdata({required SendMassageModel sendMessage}) async {
    await dio.post(
      baseUrl,
      data: sendMessage.toJson(),
      options: Options(
        headers: {
          "Authorization":
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTYwMzAwOTgsImlhdCI6MTcxMzQzODA5OCwicm9sZSI6InRlc3QiLCJzaWduIjoiYWY2MmEwOTcyNWI3OGVkNWY2N2FhNTFhY2FhZDZmOWNmNTMzZDQ4NzhkODNkMjI3ZDE4YjY0MDAzMDZhYjMwYyIsInN1YiI6IjY2MzIifQ.jLtRG4lTRyPyiJQGQYnFf7d6FnQ5g_onx6MqBnYdyKA'
        },
      ),
    );
  }
}
