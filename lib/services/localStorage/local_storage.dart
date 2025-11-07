import 'package:hive/hive.dart';

import '../../../utils/constants/constants.dart';

String userTypeStr = "user_type";

class LocalStorage {
  // static Future<void> saveIsDarkMode(bool isDark) async {
  //   await Hive.box(local).put("isDarkMode", isDark);
  // }

  // static bool getIsDarkMode() {
  //   return Hive.box(local).get("isDarkMode", defaultValue: false);
  // }

  static saveCartTime(String cartTime) {
    Hive.box(token).put("cartTime", cartTime);
  }

  static String getCartTime() {
    return Hive.box(token).get("cartTime", defaultValue: "");
  }

  static saveCartTimeAdded(String cartTime) {
    Hive.box(token).put("cartTimeAdded", cartTime);
  }

  static String getCartTimeAdded() {
    return Hive.box(token).get("cartTimeAdded", defaultValue: "");
  }

  static saveIsEmailNot(bool isEmailNot) {
    Hive.box(token).put("emailNot", isEmailNot);
  }

  static bool getIsEmailNot() {
    return Hive.box(token).get("emailNot", defaultValue: true);
  }

  static saveIsChatNot(bool isChatNot) {
    Hive.box(token).put("chatNot", isChatNot);
  }

  static bool getIsChatNot() {
    return Hive.box(token).get("chatNot", defaultValue: true);
  }

  static saveIsPushNot(bool isPushNot) {
    Hive.box(token).put("pushNot", isPushNot);
  }

  static bool getIsPushNot() {
    return Hive.box(token).get("pushNot", defaultValue: true);
  }

  static saveToken(String newToken) {
    Hive.box(token).put("token", newToken);
  }

  static String getToken() {
    return Hive.box(token).get("token", defaultValue: "");
  }

  static saveUserCode(String code) {
    Hive.box(local).put("userData", code);
  }

  static String getUserCode() {
    return Hive.box(local).get("userData", defaultValue: "");
  }

  static saveIsEmailVerified(bool status) {
    Hive.box(local).put("isEmailVerified", status);
  }

  static bool isEmailVerified() {
    return Hive.box(local).get("isEmailVerified", defaultValue: false);
  }

  static saveEmail(String email) {
    Hive.box(local).put("email", email);
  }

  static String getEmail() {
    return Hive.box(local).get("email", defaultValue: "");
  }

  static saveCurr(String curr) {
    Hive.box(local).put("currency", curr);
  }

  static String getCurr() {
    return Hive.box(local).get("currency", defaultValue: "₦");
  }

  static saveCountryIso(String code) {
    Hive.box(local).put("country_code", code);
  }

  static String getCountryIso() {
    return Hive.box(local).get("country_code", defaultValue: "");
  }

  static saveCountryId(String id) async {
    await Hive.box(local).put("country_id", id);
  }

  static String getCountryId() {
    return Hive.box(local).get("country_id", defaultValue: "");
  }

  static saveName(String name) {
    Hive.box(local).put("name", name);
  }

  static String getName() {
    return Hive.box(local).get("name", defaultValue: "");
  }

  static savePic(String pic) {
    Hive.box(local).put("pic", pic);
  }

  static String getPic() {
    return Hive.box(local).get("pic", defaultValue: "");
  }

  static saveNumber(String number) {
    Hive.box(local).put("number", number);
  }

  static String getNumber() {
    return Hive.box(local).get("number", defaultValue: "");
  }

  static saveState(String state) {
    Hive.box(local).put("state", state);
  }

  static String getState() {
    return Hive.box(local).get("state", defaultValue: "");
  }

  static saveStateName(String state) {
    Hive.box(local).put("state_name", state);
  }

  static String getStateName() {
    return Hive.box(local).get("state_name", defaultValue: "");
  }

  static saveCity(String city) {
    Hive.box(local).put("city", city);
  }

  static String getCity() {
    return Hive.box(local).get("city", defaultValue: "");
  }

  static saveCitySlug(String city) {
    Hive.box(local).put("city_slug", city);
  }

  static String getCitySlug() {
    return Hive.box(local).get("city_slug", defaultValue: "");
  }

  static saveLoginTime() {
    DateTime loginTime = DateTime.now();
    String loginTimeString = loginTime.toIso8601String();
    Hive.box(local).put("time", loginTimeString);
  }

  static String getLoginTime() {
    return Hive.box(local).get("time", defaultValue: "");
  }

  static bool isFirstTime() {
    return Hive.box(local).get("isFirstTime", defaultValue: true);
  }

  static changeIsFirstTime(bool status) async {
    await Hive.box(local).put("isFirstTime", status);
  }

  static Future<void> clear() async {
    await Hive.box(token).clear();
    await Hive.box(local).clear();
  }

  static Future<void> clearToken() async {
    await Hive.box(token).clear();
  }
}
