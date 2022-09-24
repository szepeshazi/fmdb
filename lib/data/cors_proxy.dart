import 'package:http/http.dart' as http;

/// A CORS Proxy client that reroutes http requests through a predefined proxy service
/// When running in browser, this is necessary to load network assets that are served without
/// an `Access-Control-Allow-Origin` header that explicitly allows CORS requests
class CorsProxyClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    final proxiedEndpoint = _patchUrl(request.url.toString());
    final proxiedUrl = Uri.parse(proxiedEndpoint);
    final proxiedRequest = http.Request(request.method, proxiedUrl);
    return _client.send(proxiedRequest);
  }

  String _patchUrl(String url) => "$corsEndpoint$url";

  static final _client = http.Client();

  /// A public CORS proxy endpoint that may to be used for development purposes
  static const corsEndpoint = "https://cors-container.herokuapp.com/";
}
