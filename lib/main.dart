import 'package:coffe_shop_project/Mongo/mongo_server.dart';
import 'package:coffe_shop_project/bloc/orders/bloc/order_bloc.dart';
import 'package:coffe_shop_project/pages/start/start_page.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/movie/bloc/coffee_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoServer.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setSystemUIOverlayStyle(
      const services.SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor:
              Colors.transparent // Set the desired background color
          ),
    );

    services.SystemChrome.setEnabledSystemUIMode(
        services.SystemUiMode.edgeToEdge,
        overlays: [services.SystemUiOverlay.top]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoffeeBloc>(create: (_) => CoffeeBloc()),
        BlocProvider<OrderBloc>(create: (_) => OrderBloc()),
      ],
      child: MaterialApp(
        title: 'Coffee Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: GoogleFonts.soraTextTheme(
            // Replace 'Poppins' with your desired font family
            Theme.of(context).textTheme,
          ),
        ),
        home: const StartPage(),
      ),
    );
  }
}
