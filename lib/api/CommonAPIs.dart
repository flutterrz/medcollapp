import 'package:dio/dio.dart';
import 'package:medcollapp/api/DioClient.dart';
import 'package:medcollapp/models/CountryModel.dart';
import 'package:medcollapp/models/CurrencyInfo.dart';
import 'package:medcollapp/utils/Extensions.dart';

class CommonAPIs {
  static Future<CountryModel> getCountryCode(double lat, double lang) async {
    final resp = await DioClient.client.get('countryCode',
        queryParameters: {"lat": lat, "lng": lang, "username": "medcollapp"});

    if (resp.isSuccess) {
      return CountryModel.fromMap(resp.data);
    } else {
      throw resp.data;
    }
  }

  static Future<List<CountryModel>> getCountryInfo(String countryCode) async {
    final resp = await DioClient.client.get('countryInfo',
        queryParameters: {"country": countryCode, "username": "medcollapp"});

    if (resp.isSuccess) {
      return resp.data['geonames']
          .map<CountryModel>((e) => CountryModel.fromMap(e))
          .toList();
    } else {
      throw resp.data;
    }
  }

  static Future<CurrencyInfo> getCurrencyInfo(String currencyCode) async {
    final resp = await Dio().get(
        "https://api.exchangerate.host/latest?base=USD&symbols=$currencyCode&amount=1&places=2");

    if (resp.isSuccess) {
      return CurrencyInfo.fromMap(resp.data);
    } else {
      throw resp.data;
    }
  }
}
