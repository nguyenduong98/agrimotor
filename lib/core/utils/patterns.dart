part of 'utils.dart';

class Patterns {
  Patterns._();

  static const url =
      r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})';

  static const email = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  static const password =
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";

  static const mobilePhone = r"^(\+84|0)[3,5,7,8,9]{1}[0-9]{8}$";
  static const phone =
      r"^(\+84|0)(((24|28)[0-9]{8})|(2((0[3-9])|(1[0-68-9])|(2[2-6])|(3[2-9])|(5[1-24-9])|(6[0-39])|(7[0-7])|(9[0-4679]))[0-9]{7}))$";

  static const memberCard = r"^[0-9]{16}$";
  static const cmnd = r"^([0-9]{9}|[0-9]{12})$";
  static const passport = r"^[A-Z0-9]{8,12}$";
  static const html = r"<(“[^”]*”|'[^']*'|[^'”>])*>";
  static const storeCode = r"(vi|kr|en)(-|_)[a-z]{3}$";
  static const taxCode = r"([0-9]{10}|[0-9]{10}-[0-9]{3})$";
  static const houseNumber = r"^.{10,}";
  static const youtubeUrl =
      r"^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$";
}
