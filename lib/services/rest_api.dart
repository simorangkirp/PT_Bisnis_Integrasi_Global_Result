import 'package:big_test/services/net_util.dart';

class RestApi {
  NetworkUtil util = NetworkUtil();

  Future<dynamic> login(Map<String, dynamic>? bodies) {
    return util
        .post(
      "https://dportv2.development-big.com/api_v1/login/loginDriver",
      body: bodies,
    )
        .then((value) {
      return value;
    });
  }

  Future<dynamic> apiGetCardItems({
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) {
    return util
        .post(
      "https://dportv2.development-big.com/api_v1/Driver/listBursaPengirimanDriver",
      headers: header,
      body: body,
      encoding: null,
    )
        .then((value) {
      return value;
    });
  }

  Future<dynamic> getItemDetails({
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) {
    return util
        .post(
      "https://dportv2.development-big.com/api_v1/Driver/detail_pengiriman",
      headers: header,
      body: body,
    )
        .then((value) {
      return value;
    });
  }
}
