import 'dart:convert';

VpnConfigModel vpnConfigModelFromJson(String str) =>
    VpnConfigModel.fromJson(json.decode(str));

String vpnConfigModelToJson(VpnConfigModel data) => json.encode(data.toJson());

class VpnConfigModel {
  VpnConfigModel({
    this.server = const [],
  });

  List<Server> server;

  VpnConfigModel copyWith({
    List<Server>? server,
  }) =>
      VpnConfigModel(
        server: server ?? this.server,
      );

  factory VpnConfigModel.fromJson(Map<String, dynamic> json) => VpnConfigModel(
        server:
            List<Server>.from(json["server"].map((x) => Server.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "server": List<dynamic>.from(server.map((x) => x.toJson())),
      };

  Map<String, dynamic> toJsonWithOutConfig() => {
        "server":
            List<dynamic>.from(server.map((x) => x.toJsonWithOutConfig())),
      };

  VpnConfigModel changeConfig(String value) {
    for (Server element in server) {
      element = element.copyWith(config: value);
    }
    return this;
  }
}

class Server {
  Server({
    this.flag,
    this.countryName,
    this.config,
  });

  String? flag;
  String? countryName;
  String? config;

  Server copyWith({
    String? flag,
    String? countryName,
    String? config,
  }) =>
      Server(
        flag: flag ?? this.flag,
        countryName: countryName ?? this.countryName,
        config: config ?? this.config,
      );

  factory Server.fromJson(Map<String, dynamic> json) => Server(
        flag: json["flag"],
        countryName: json["countryName"],
        config: json["config"],
      );

  Map<String, dynamic> toJson() => {
        "flag": flag,
        "countryName": countryName,
        "config": config,
      };

  Map<String, dynamic> toJsonWithOutConfig() => {
        "flag": flag,
        "countryName": countryName,
      };
}
