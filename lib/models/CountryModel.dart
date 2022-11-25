// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CountryModel {
  String? continent;
  String? capital;
  String? languages;
  int? geonameId;
  double? south;
  String? isoAlpha3;
  double? north;
  String? fipsCode;
  String? population;
  double? east;
  String? isoNumeric;
  String? areaInSqKm;
  String? countryCode;
  double? west;
  String? countryName;
  String? postalCodeFormat;
  String? continentName;
  String? currencyCode;
  CountryModel({
    this.continent,
    this.capital,
    this.languages,
    this.geonameId,
    this.south,
    this.isoAlpha3,
    this.north,
    this.fipsCode,
    this.population,
    this.east,
    this.isoNumeric,
    this.areaInSqKm,
    this.countryCode,
    this.west,
    this.countryName,
    this.postalCodeFormat,
    this.continentName,
    this.currencyCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'continent': continent,
      'capital': capital,
      'languages': languages,
      'geonameId': geonameId,
      'south': south,
      'isoAlpha3': isoAlpha3,
      'north': north,
      'fipsCode': fipsCode,
      'population': population,
      'east': east,
      'isoNumeric': isoNumeric,
      'areaInSqKm': areaInSqKm,
      'countryCode': countryCode,
      'west': west,
      'countryName': countryName,
      'postalCodeFormat': postalCodeFormat,
      'continentName': continentName,
      'currencyCode': currencyCode,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      continent: map['continent'] != null ? map['continent'] as String : null,
      capital: map['capital'] != null ? map['capital'] as String : null,
      languages: map['languages'] != null ? map['languages'] as String : null,
      geonameId: map['geonameId'] != null ? map['geonameId'] as int : null,
      south: map['south'] != null ? map['south'] as double : null,
      isoAlpha3: map['isoAlpha3'] != null ? map['isoAlpha3'] as String : null,
      north: map['north'] != null ? map['north'] as double : null,
      fipsCode: map['fipsCode'] != null ? map['fipsCode'] as String : null,
      population: map['population'] != null ? map['population'] as String : null,
      east: map['east'] != null ? map['east'] as double : null,
      isoNumeric: map['isoNumeric'] != null ? map['isoNumeric'] as String : null,
      areaInSqKm: map['areaInSqKm'] != null ? map['areaInSqKm'] as String : null,
      countryCode: map['countryCode'] != null ? map['countryCode'] as String : null,
      west: map['west'] != null ? map['west'] as double : null,
      countryName: map['countryName'] != null ? map['countryName'] as String : null,
      postalCodeFormat: map['postalCodeFormat'] != null ? map['postalCodeFormat'] as String : null,
      continentName: map['continentName'] != null ? map['continentName'] as String : null,
      currencyCode: map['currencyCode'] != null ? map['currencyCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
