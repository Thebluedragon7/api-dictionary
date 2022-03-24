import 'package:apidictionary/screens/splashScreens/splashScreen.dart';
import 'package:apidictionary/services/providers/favouriteProvider.dart';
import 'package:apidictionary/services/providers/historyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/providers/themeProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
          title: 'API Dictionary',
          themeMode: ThemeMode.light,
          theme: TBDTheme.light,
          home: const SplashScreen(),
      ),
    ),
  );
}



// https://coolors.co/9fc3a8-afd7b9-c1edcc-b9d7c4-b0c0bc-acb4b3-a7a7a9-797270-453f3c-56504e