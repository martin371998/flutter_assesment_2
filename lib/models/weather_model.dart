class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
  });
  late final Location location;
  late final Current current;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  late final String name;
  late final String region;
  late final String country;
  late final num lat;
  late final num lon;
  late final String tzId;
  late final num localtimeEpoch;
  late final String localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });
  late final num lastUpdatedEpoch;
  late final String lastUpdated;
  late final num tempC;
  late final num tempF;
  late final num isDay;
  late final Condition condition;
  late final num windMph;
  late final num windKph;
  late final num windDegree;
  late final String windDir;
  late final num pressureMb;
  late final num pressureIn;
  late final num precipMm;
  late final num precipIn;
  late final num humidity;
  late final num cloud;
  late final num feelslikeC;
  late final num feelslikeF;
  late final num visKm;
  late final num visMiles;
  late final num uv;
  late final num gustMph;
  late final num gustKph;

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['last_updated_epoch'] = lastUpdatedEpoch;
    _data['last_updated'] = lastUpdated;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['uv'] = uv;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    return _data;
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
  late final String text;
  late final String icon;
  late final num code;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}
