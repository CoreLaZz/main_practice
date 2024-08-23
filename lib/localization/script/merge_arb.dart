import 'dart:convert';
import 'dart:io';

Future<void> mergeArbFiles(String locale, List<String> arbFiles, String outputFile) async {
  final Map<String, dynamic> mergedData = {};

  if (arbFiles.isEmpty) {
    print('No ARB files provided for locale: $locale');
    return;
  }

  for (final file in arbFiles) {
    try {
      final content = await File(file).readAsString();
      final Map<String, dynamic> jsonData = json.decode(content);
      mergedData.addAll(jsonData);
    } catch (e) {
      print('Error reading or parsing file $file: $e');
      return;
    }
  }

  try {
    final outputDir = Directory(outputFile).parent;
    if (!await outputDir.exists()) {
      await outputDir.create(recursive: true);
    }

    final mergedFile = File(outputFile);
    await mergedFile.writeAsString(JsonEncoder.withIndent('  ').convert(mergedData));

    print('Successfully merged $locale .arb files into $outputFile');
  } catch (e) {
    print('Error writing to output file $outputFile: $e');
  }
}

Future<Map<String, List<String>>> findArbFiles(String baseDir) async {
  final Map<String, List<String>> locales = {};

  final dir = Directory(baseDir);
  if (await dir.exists()) {
    final entities = dir.listSync(recursive: true, followLinks: false);
    for (var entity in entities) {
      if (entity is File && entity.path.endsWith('.arb')) {
        // Extract locale code from filename (e.g., 'intl_en.arb' -> 'en')
        final filename = entity.uri.pathSegments.last;
        final locale = filename.split('_').last.split('.').first;

        if (!locales.containsKey(locale)) {
          locales[locale] = [];
        }
        locales[locale]!.add(entity.path);
      }
    }
  }
  return locales;
}

Future<void> deleteUnusedArbFiles(String outputDir, List<String> activeLocales) async {
  final outputDirectory = Directory(outputDir);

  if (await outputDirectory.exists()) {
    final existingFiles = outputDirectory.listSync().whereType<File>();

    for (var file in existingFiles) {
      final filename = file.uri.pathSegments.last;
      final locale = filename.split('_').last.split('.').first;

      if (!activeLocales.contains(locale)) {
        try {
          await file.delete();
          print('Deleted unused ARB file: $filename');
        } catch (e) {
          print('Error deleting file $filename: $e');
        }
      }
    }
  }
}

void main() async {
  // Define the base directory containing all ARB files
  final baseDir = 'lib/features';

  // Automatically find and group ARB files by locale
  final locales = await findArbFiles(baseDir);

  final outputDir = 'lib/localization/l10n';

  for (final entry in locales.entries) {
    final locale = entry.key;
    final arbFiles = entry.value;
    final outputFile = '$outputDir/intl_$locale.arb';
    await mergeArbFiles(locale, arbFiles, outputFile);
  }

  // Delete ARB files in the output directory that are not present in the current locales
  await deleteUnusedArbFiles(outputDir, locales.keys.toList());

  print('Merging completed.');
}
