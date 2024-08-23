import 'dart:io';
import 'package:watcher/watcher.dart';

Future<void> main() async {
  // Set the path to the directory containing your ARB files
  final arbDirectory = 'lib/features'; // Update with your ARB directory path

  // Initialize a directory watcher
  final watcher = DirectoryWatcher(arbDirectory);

  print('Watching $arbDirectory for changes...');

  // Listen for file changes
  watcher.events.listen((event) async {
    // Filter for changes in .arb files only
    if (event.path.endsWith('.arb')) {
      print('Change detected in ${event.path}. Running merge_and_generate.dart...');
      
      // Run the merge script
      final process = await Process.start(
        'dart',
        ['run', 'lib/localization/script/merge_and_generate.dart'],
        mode: ProcessStartMode.inheritStdio,
      );
      
      await process.exitCode;
      print('Merge and generate script finished.');
    }
  });
}
