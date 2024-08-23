import 'dart:convert';
import 'dart:io';

Future<void> mergeArbFiles(String locale, List<String> arbFiles, String outputFile) async {
  final Map<String, dynamic> mergedData = {};

  for (final file in arbFiles) {
    final content = await File(file).readAsString();
    final Map<String, dynamic> jsonData = json.decode(content);
    mergedData.addAll(jsonData);
  }

  final mergedFile = File(outputFile);
  await mergedFile.writeAsString(JsonEncoder.withIndent('  ').convert(mergedData));

  print('Merged $locale .arb files into $outputFile');
}

void main() async {
  final enFiles = [
    'lib/features/home/data/l10n/intl_en.arb',
    'lib/features/product/data/l10n/intl_en.arb',
    'lib/features/setting/data/l10n/intl_en.arb',
  ];

  final kmFiles = [
    'lib/features/home/data/l10n/intl_km.arb',
    'lib/features/product/data/l10n/intl_km.arb',
    'lib/features/setting/data/l10n/intl_km.arb',
  ];

  await mergeArbFiles('en', enFiles, 'lib/l10n/intl_en.arb');
  await mergeArbFiles('km', kmFiles, 'lib/l10n/intl_km.arb');
}
