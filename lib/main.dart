import 'package:banking_ui/views/splash_screen.dart';
import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/services/storage_service.dart';
import 'package:banking_ui/viewmodels/bank_viewmodel.dart';
import 'package:banking_ui/widgets/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await StorageService.init();
  final viewModel = BankViewModel(storageService: storage);
  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final BankViewModel viewModel;
  
  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewModel: viewModel,
      child: MaterialApp(
        title: 'Banking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF024751),
            primary: const Color(0xFF024751),
            secondary: const Color(0xFFDFE94B),
            surface: const Color(0xFFF8FAFC),
          ),
          textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFFF8FAFC),
            elevation: 0,
            scrolledUnderElevation: 0.0,
            surfaceTintColor: Colors.transparent,
            centerTitle: false,
            iconTheme: IconThemeData(color: Styles.primaryColor),
            titleTextStyle: GoogleFonts.outfit(
              color: Styles.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
