import 'package:get/get.dart';
import 'package:medcollapp/api/CommonAPIs.dart';
import 'package:medcollapp/api/DioClient.dart';
import 'package:medcollapp/models/CountryModel.dart';
import 'package:medcollapp/models/CurrencyInfo.dart';
import 'package:medcollapp/utils/LocationUtils.dart';
import 'package:medcollapp/utils/SharedPrefs.dart';

class HomeController extends GetxController {
  final Rx<bool> _showProgress = false.obs;
  bool get showProgress => _showProgress.value;
  set showProgress(val) => _showProgress.value = val;

  final Rx<CountryModel> _countryData = CountryModel().obs;
  CountryModel get countryData => _countryData.value;
  final Rx<CurrencyInfo> _currencyInfo = CurrencyInfo().obs;
  CurrencyInfo get currencyInfo => _currencyInfo.value;

  initData() {
    try {
      if ((SharedPrefs.read(PrefConstants.country) != null) &&
          (SharedPrefs.read(PrefConstants.currency) != null)) {
        _countryData.value = CountryModel.fromJson(
            SharedPrefs.readStringValue(PrefConstants.country));
        _currencyInfo.value = CurrencyInfo.fromJson(
            SharedPrefs.readStringValue(PrefConstants.currency));
      } else {
        getDetails();
      }
    } catch (e) {
      showError(e);
    }
  }

  getDetails() async {
    try {
      showProgress = true;
      final country = await getCountryCode();
      await getCountryInfo(country.countryCode!);
      await getCurrencyInfo();
      await SharedPrefs.writeValue(PrefConstants.country, countryData.toJson());
      await SharedPrefs.writeValue(
          PrefConstants.currency, currencyInfo.toJson());
    } catch (e) {
      showError(e);
    } finally {
      showProgress = false;
    }
  }

  getCountryCode() async {
    try {
      final locationData = await LocationUtils.getLocationData();
      if (locationData != null) {
        return await CommonAPIs.getCountryCode(
            locationData.latitude!, locationData.longitude!);
      }
    } catch (e) {
      showError(e);
    }
  }

  getCountryInfo(String countryCode) async {
    try {
      final geoNameList = await CommonAPIs.getCountryInfo(countryCode);
      if (geoNameList.isNotEmpty) {
        _countryData.value = geoNameList.first;
      }
    } catch (e) {
      showError(e);
    }
  }

  getCurrencyInfo() async {
    try {
      _currencyInfo.value =
          await CommonAPIs.getCurrencyInfo(countryData.currencyCode!);
    } catch (e) {
      showError(e);
    }
  }
}
