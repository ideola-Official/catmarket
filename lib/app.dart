import 'package:flutter/material.dart';

import 'features/auth/presentation/email_verification_screen.dart';
import 'features/shell/presentation/home_shell.dart';

class CampMarketApp extends StatefulWidget {
  const CampMarketApp({super.key});

  @override
  State<CampMarketApp> createState() => _CampMarketAppState();
}

class _CampMarketAppState extends State<CampMarketApp> {
  bool _isVerified = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '캠마켓',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6F0F),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
        textTheme: Typography.blackCupertino.copyWith(
          bodyMedium: const TextStyle(fontSize: 14),
          bodyLarge: const TextStyle(fontSize: 16),
          titleMedium: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      home: _isVerified
          ? const HomeShell()
          : EmailVerificationScreen(
              onVerificationComplete: () {
                setState(() {
                  _isVerified = true;
                });
              },
            ),
    );
  }
}

