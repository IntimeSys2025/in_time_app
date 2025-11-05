import 'package:in_time_app/core/utils/product_type.dart';

sealed class AppConstants {
 // static List<DateTime> availableDays = [
 //  DateTime(2023, 10, 5),
 //  DateTime(2023, 10, 6),
 //  DateTime(2023, 10, 10),
 //  DateTime(2023, 10, 11),
 //  DateTime(2023, 10, 12),
 //  DateTime(2023, 10, 13),
 //  DateTime(2023, 10, 14),
 //  DateTime(2023, 10, 15),
 //  DateTime(2023, 10, 16),
 //  DateTime(2023, 10, 23),
 //  DateTime(2023, 10, 24),
 //  DateTime(2023, 10, 25),
 //  DateTime(2023, 10, 27),
 //  DateTime(2023, 10, 28),
 //  DateTime(2023, 10, 29),
 //  DateTime(2023, 10, 30),
 // ];

 static bool isLoggedIn = false;
 static String userToken = '';
 static String fullName ='';
 static String? userMobile ;
 static String additionalMobile = '';
 static String dateOfBirth = '';
  static const ProductType productType = ProductType.oneDoctor;
  static const imageURL =
      'https://img.freepik.com/free-photo/lifestyle-people-emotions-casual-concept-confident-nice-smiling-asian-woman-cross-arms-chest-confident-ready-help-listening-coworkers-taking-part-conversation_1258-59335.jpg?semt=ais_hybrid&w=740';
  static const double padding16 = 16;
  static const double padding14 = 14;
  static const double padding12 = 12;
  static const double padding8 = 8;
  static const double radius8 = 8;
  static const double radius12 = 12;
  static const double gap = 8;
  static const double bigIcon = 40;
  static const double smallIcon = 30;

  /// TODO: make user token more secure
  // static String userToken = '';
}
