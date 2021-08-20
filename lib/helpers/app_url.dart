class AppUrl {
  static const String baseUrl = 'https://mybetaride.herokuapp.com/api/v1';
  static const String register = baseUrl + '/auth/register';
  static const String login = baseUrl + '/auth/login';
  static const String forgot = baseUrl + '/auth/forgotpassword';
  static const String updateProfile = baseUrl + '/auth/me';
  static const String addVehicle = baseUrl + '/vehicle/';
  static const String documentUpload = baseUrl + '/documentupload';
  static const String getVehicle = baseUrl + '/vehicle/me';
}
