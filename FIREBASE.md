
npm i -g firebase-tools

firebase login

dart pub global activate flutterfire_cli

flutter pub get add firebase_core

flutterfire configure


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      child: const MyApp(),
  );
}