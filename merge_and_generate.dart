import 'dart:io';

Future<void> main() async {
  // Execute merge_arb.dart
  print('Merging ARB files...');
  final mergeProcess = await Process.start(
    'dart',
    ['run', 'merge_arb.dart'],
    mode: ProcessStartMode.inheritStdio,
  );
  await mergeProcess.exitCode;

  // Execute intl_utils:generate
  print('Generating localization files...');
  final generateProcess = await Process.start(
    'dart',
    ['run', 'intl_utils:generate'],
    mode: ProcessStartMode.inheritStdio,
  );
  await generateProcess.exitCode;

  print('Done.');
}
