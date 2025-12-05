library flutter_project_tool;

import 'dart:io';

import 'package:yaml/yaml.dart';

void updateVersion() {
  print('updateVersion');
  final config = getConfig();
  final pubspecFile = File('pubspec.yaml');
  var yamlString = pubspecFile.readAsStringSync();
  final exp = RegExp(r'^version:\s*([\d.]+)\+(\d+)', multiLine: true);
  
  final match = exp.firstMatch(yamlString);
  if (match != null) {
    final rawVersionStr = config['version'];
    final versionStr = rawVersionStr.replaceAll('.', '');
    final version = int.tryParse(versionStr) ?? 0;
    final versionNumberStr = match.group(2)!;
    var versionNumber = int.tryParse(versionNumberStr) ?? 0;
    if (!versionNumberStr.startsWith(versionStr)) {
      versionNumber = version * 1000000;
    }
    if (versionNumber < version) {
      versionNumber = version;
    }
    versionNumber += 1;
    var versionNumberPadded = versionNumber.toString().padLeft(6, '0');
    final newVersion = '$rawVersionStr+$versionNumberPadded';
    yamlString = yamlString.replaceRange(
        match.start, match.end, 'version: $newVersion');
  }
  final file = File('.build_version');
  if (!file.existsSync()) {
    file.createSync();
  }
  file.writeAsStringSync(config['version']);
  pubspecFile.writeAsStringSync(yamlString);
}

Map<String, dynamic> getConfig({String? configFile}) {
  String filePath;
  if (configFile != null && File(configFile).existsSync()) {
    filePath = configFile;
  } else if (File('flutter_project_tool.yaml').existsSync()) {
    filePath = 'flutter_project_tool.yaml';
  } else {
    filePath = 'pubspec.yaml';
  }

  final Map yamlMap = loadYaml(File(filePath).readAsStringSync());

  if (yamlMap['flutter_project_tool'] is! Map) {
    throw Exception('Your `$filePath` file does not contain a '
        '`flutter_project_tool` section.');
  }

  // yamlMap has the type YamlMap, which has several unwanted side effects
  final config = <String, dynamic>{};
  for (MapEntry<dynamic, dynamic> entry
      in yamlMap['flutter_project_tool'].entries) {
    if (entry.value is YamlList) {
      var list = <String>[];
      for (var value in (entry.value as YamlList)) {
        if (value is String) {
          list.add(value);
        }
      }
      config[entry.key] = list;
    } else {
      config[entry.key] = entry.value;
    }
  }
  return config;
}
