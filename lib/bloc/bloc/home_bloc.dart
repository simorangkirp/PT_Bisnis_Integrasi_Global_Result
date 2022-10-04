import 'dart:convert';

import 'package:big_test/bloc/event/home_event.dart';
import 'package:big_test/bloc/state/home_state.dart';
import 'package:big_test/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../model/card_model.dart';
import '../../model/details_model.dart';
import '../../services/database_helper.dart';
import '../../services/rest_api.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingHome());
  RestApi api = RestApi();
  CardData modelCard = CardData();
  late LoginModel _login;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    var db = DB();
    try {
      await _query(db);
      if (event is InitHome) {
        yield LoadingHome();
        var cardList = await getDataCard(
          event.limit.toString(),
          event.offset.toString(),
        );
        yield HomeDataLoaded(
          cardList,
        );
      } else if (event is ToDetailScreen) {
        yield LoadingHome();
        var detailModel = await getDetailModel(
          event.orderId,
        );
        yield DetailLoaded(
          detailModel,
        );
      }
    } catch (e) {
      // print(e.toString());
      yield HomeError(e.toString());
    }
  }

  _query(DB dbhelper) async {
    final user = await dbhelper.getUser();
    if (user != null) {
      _login = user;
    }
  }

  Future<List<CardData>> getDataCard(String? limit, String? offset) async {
    List<CardData> listData = [];
    Map<String, dynamic> params = {'limit': limit ?? 10, 'offset': offset ?? 1};
    Map<String, String> headers = {
      "Authorization": _login.token ?? "",
      'Content-type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
    };
    final bodyContent = jsonEncode(params);

    // With Net-Util
    // var response = await api.apiGetCardItems(
    //   header: {
    //     "Authorization": "${_login.token}",
    //   },
    //   body: params,
    // );
    // // this.paging = Paging.map(response);
    // if (response is List) {
    //   for (var item in response) {
    //     listData.add(CardData.fromJson(item));
    //   }
    // }

    // Try without Net-Util
    var response = await http.post(
      Uri.https("dportv2.development-big.com", 'api_v1/Driver/listBursaPengirimanDriver'),
      headers: headers,
      body: bodyContent,
    );
    var jsonData = jsonDecode(response.body);
    if (jsonData is List) {
      for (var item in jsonData) {
        listData.add(CardData.fromJson(item));
      }
    }
    return listData;
  }

  Future<DetailModel> getDetailModel(int? orderId) async {
    DetailModel model;
    Map<String, dynamic> params = {
      "id_order": orderId,
    };
    Map<String, String> headers = {
      "Authorization": _login.token ?? "",
      'Content-type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
    };
    final bodyContent = jsonEncode(params);

    var response = await http.post(
      Uri.https("dportv2.development-big.com", 'api_v1/Driver/detail_pengiriman'),
      headers: headers,
      body: bodyContent,
    );

    var jsonData = jsonDecode(response.body);
    model = DetailModel.fromJson(jsonData);

    // var response = await http.post(Uri.https("dportv2.development-big.com", 'api_v1/Driver/detail_pengiriman'),
    // final uri = Uri.parse('https://dportv2.development-big.com/api_v1/Driver/detail_pengiriman');

    // http.Response response = await http.post(
    //   uri,
    //   headers: headers,
    //   body: params,
    //   encoding: encoding,
    // );
    // headers: headers, body: jsonBody, encoding: encoding);
    // var jsonData = jsonDecode(response.body);

    return model;
  }
}
