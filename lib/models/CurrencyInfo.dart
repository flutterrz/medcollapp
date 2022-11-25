import 'dart:convert';

class CurrencyInfo {
  Motd? motd;
  bool? success;
  String? base;
  String? date;
  Rates? rates;
  CurrencyInfo({
    this.motd,
    this.success,
    this.base,
    this.date,
    this.rates,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'motd': motd?.toMap(),
      'success': success,
      'base': base,
      'date': date,
      'rates': rates?.toMap(),
    };
  }

  factory CurrencyInfo.fromMap(Map<String, dynamic> map) {
    return CurrencyInfo(
      motd: map['motd'] != null
          ? Motd.fromMap(map['motd'] as Map<String, dynamic>)
          : null,
      success: map['success'] != null ? map['success'] as bool : null,
      base: map['base'] != null ? map['base'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      rates: map['rates'] != null
          ? Rates.fromMap(map['rates'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyInfo.fromJson(String source) =>
      CurrencyInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Motd {
  String? msg;
  String? url;
  Motd({
    this.msg,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msg': msg,
      'url': url,
    };
  }

  factory Motd.fromMap(Map<String, dynamic> map) {
    return Motd(
      msg: map['msg'] != null ? map['msg'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Motd.fromJson(String source) =>
      Motd.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Rates {
  num? iNR;
  Rates({
    this.iNR,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'INR': iNR,
    };
  }

  factory Rates.fromMap(Map<String, dynamic> map) {
    return Rates(
      iNR: map['INR'] != null ? map['INR'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rates.fromJson(String source) =>
      Rates.fromMap(json.decode(source) as Map<String, dynamic>);
}
