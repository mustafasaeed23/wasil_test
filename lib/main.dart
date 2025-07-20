import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:store_app/core/helpers/service_locator.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/themes.dart';
import 'package:store_app/features/auth/bloc/auth_bloc.dart';
import 'package:store_app/features/auth/data/auth_repository.dart';
import 'package:store_app/features/home/domain/usecases/products_use_case.dart';
import 'package:store_app/features/home/presentation/cubit/products_cubit.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register all dependencies before running the app
  await ServicesLocator().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AuthBloc(AuthRepository())),
              BlocProvider(
                create:
                    (context) => ProductsCubit(
                      productsUseCase: getIt.get<ProductsUseCase>(),
                    )..getAllProducts(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Wasil Test',
              navigatorKey: navigatorKey,
              theme: lightTheme,
              onGenerateRoute: widget.appRouter.generateRoute,
              initialRoute: Routes.loginScreen,
              builder:
                  (context, child) => ResponsiveBreakpoints.builder(
                    child: child!,
                    breakpoints: [
                      const Breakpoint(start: 0, end: 450, name: MOBILE),
                      const Breakpoint(start: 451, end: 800, name: TABLET),
                      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                      const Breakpoint(
                        start: 1921,
                        end: double.infinity,
                        name: '4K',
                      ),
                    ],
                  ),
            ),
          ),
    );
  }
}
