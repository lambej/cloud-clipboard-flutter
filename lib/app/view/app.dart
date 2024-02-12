import 'package:cloud_clipboard/l10n/l10n.dart';
import 'package:cloud_clipboard/text_clipboard/repository/clipboard_repository.dart';
import 'package:cloud_clipboard/text_clipboard/text_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({required ClipboardRepository clipboardRepository, super.key})
      : _clipboardRepository = clipboardRepository;
  final ClipboardRepository _clipboardRepository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 5, 142, 196),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 5, 142, 196),
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) =>
            TextClipboardBloc(clipboardRepository: _clipboardRepository)
              ..add(TextClipboardRegister()),
        child: const TextClipboardPage(),
      ),
    );
  }
}
