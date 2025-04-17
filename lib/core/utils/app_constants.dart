
sealed class AppConstants  {
  static List<Map<String, String>> carImages = [
    {
      'image': 'assets/images/slide1.jpg',
      'title': 'اكتشف أفضل العروض في المزادات المباشرة',
      'description': ' سجّل الآن وابدأ المزايدة على سياراتك المفضلة!'
    },
    {
      'image': 'assets/images/slide2.jpg',
      'title': 'سيارات بحالة ممتازة وبأسعار مغرية',
      'description': 'تابع المزادات واحصل على أفضل الصفقات'
    },
    {
      'image': 'assets/images/slide3.jpg',
      'title': 'منصة آمنة وموثوقة لبيع وشراء السيارات',
      'description': 'نخدمك بأعلى معايير الجودة والشفافية'
    }
  ];
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
  static  String userToken ='';
}
