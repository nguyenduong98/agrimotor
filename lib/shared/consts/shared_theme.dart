part of 'consts.dart';

class SharedTextTheme {
  SharedTextTheme._();

  static const roboto = TextStyle(fontFamily: 'Roboto');

  //regular fonts
  static final regular8 = TextStyle(fontSize: 8.sp);
  static final regular10 = TextStyle(fontSize: 10.sp);
  static final regular11 = TextStyle(fontSize: 11.sp);
  static final regular12 = TextStyle(fontSize: 12.sp);
  static final regular14 = TextStyle(fontSize: 14.sp);
  static final regular16 = TextStyle(fontSize: 16.sp);

  static final regular20 = TextStyle(fontSize: 20.sp);

  static final regular22 = TextStyle(fontSize: 22.sp);

  //medium fonts
  static final medium16 = roboto.copyWith(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
  );

  static final medium12 = roboto.copyWith(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
  );

  static final medium14 = roboto.copyWith(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
  );

  //semi bold fonts
  static final semibold10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );

  static final semibold11 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
  );

  static final semibold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static final semibold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static final semibold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final semibold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  static final semibold22 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
  );

  static final semibold40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
  );

  // super bolds
  static final superBold24 = roboto.copyWith(
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w800,
  );

  static final superBold32 = roboto.copyWith(
    fontSize: 32.0.sp,
    fontWeight: FontWeight.w800,
  );

  //bold fonts
  static final bold10 = TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700);
  static final bold11 = TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700);
  static final bold12 = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700);
  static final bold14 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700);
  static final bold16 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static final bold18 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700);
  static final bold20 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700);
  static final bold22 = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700);
  static final bold24 = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700);
}

extension TextStyleExt on TextStyle {
  TextStyle get white => copyWith(color: Colors.white);
}
