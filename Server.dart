import 'dart:io';

Future main() async {
  HttpServer server;

  try {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);
  } catch (exception) {
    print("Could not bind to port 4040: ${exception}");
    exit(-1);
  }

    print('Listening to localhost on ${server.port}');

  await for (HttpRequest request in server) {
    handleRequest(request);
    await request.response.close();
  }
}

HttpResponse handleRequest(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      return request.response
      ..statusCode = HttpStatus.ok
      ..write("GET request received")
      ..close();
    }
    if (request.method == 'POST') {
      return request.response
      ..statusCode = HttpStatus.ok
      ..write("POST request received")
      ..close();
    }
    if (request.method == 'PUT') {
      return request.response
      ..statusCode = HttpStatus.ok
      ..write("PUT request received")
      ..close();
    }
    if (request.method == 'DELETE') {
      return request.response
      ..statusCode = HttpStatus.ok
      ..write("DELETE request received")
      ..close();
    }
    else {
      request.response
      ..statusCode = HttpStatus.methodNotAllowed
      ..write('Unsupported request: ${request.method}')
      ..close();
    }
  } catch (exception) {
    print('Exception in handleRequest: ${exception}');
  }
}