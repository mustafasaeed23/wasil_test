import 'package:flutter/material.dart';
import 'package:store_app/core/cache_helper/cache_helper.dart';


TextStyle style14grey = CacheHelper.isEn
    ? const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFamily: "NeueHaas",
        height: 1.1,
      )
    : const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFamily: "Graphik",
        height: 1.1,
      );
