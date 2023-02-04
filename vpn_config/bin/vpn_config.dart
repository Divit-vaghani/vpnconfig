import 'dart:convert';
import 'dart:io';
import 'package:vpn_config/model/vpn_config_model.dart';
import 'package:vpn_config/utils/formatted_print.dart';

Future<void> main(List<String> arguments) async {
  File file = File("../server.json");
  File configFile = File("files/config.text");
  String server = await file.readAsString(encoding: utf8);
  VpnConfigModel vpnConfigModel = vpnConfigModelFromJson(server);
  vpnConfigModel.changeConfig(configFile.readAsStringSync(encoding: utf8));
  await file.writeAsString(formattedString(vpnConfigModel.toJson()));
  print("You Can Find Updated File in : ${file.path}");
}
