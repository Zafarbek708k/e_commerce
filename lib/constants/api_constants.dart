class Constants{
  static const String baseUrl = "https://65c717aae7c384aada6e2dae.mockapi.io";
  static const String baseApi = "/products";
  static const String basketApi = "/basket";
  static  Duration connectTimeOut = const Duration(seconds: 1);
  static  Duration receiveTimeOut = const Duration(seconds: 1);
  static const Map<String , dynamic> headers = {"Content-type":"application/json"};
}