import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_app/core/helpers/service_locator.dart';
import 'package:store_app/features/auth/presentation/screens/login_screen.dart';
import 'package:store_app/features/auth/presentation/screens/register_screen.dart';
import 'package:store_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:store_app/features/home/domain/usecases/products_use_case.dart';
import 'package:store_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:store_app/features/home/presentation/screens/home_screen.dart';
import 'package:store_app/features/home/presentation/screens/product_details_screen.dart';
import '../helpers/enums.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          settings: settings,
        );
      case Routes.registerScreen:
        return PageTransition(
          child: const RegisterScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          settings: settings,
        );
      case Routes.homeScreen:
        return PageTransition(
          child: BlocProvider(
            create:
                (context) =>
                    ProductsCubit(productsUseCase: getIt.get<ProductsUseCase>())
                      ..getAllProducts(),
            child: HomeScreen(),
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          settings: settings,
        );
      case Routes.cartScreen:
        return PageTransition(
          child: const CartScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          settings: settings,
        );

      default:
        return PageTransition(
          isIos: Platform.isIOS,
          child: Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          type: PageTransitionType.theme,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
        );
    }
  }
}
