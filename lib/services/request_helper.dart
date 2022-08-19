class RequestHelper {
  final url = 'https://pokeapi.co/api/v2';
  final timeOut = 15;
  final timeOutHttpCode = 503;
  final timeOutMessage = 'Time out, try again';
  final header = {"Content-Type": "application/json"};
}
