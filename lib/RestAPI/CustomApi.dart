import 'dart:convert';
import 'package:crudapp/Style/Style.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUrl;

  ApiHandler(this.baseUrl);

  Future<Map<String, dynamic>> _processResponse(http.Response response) async {
    final dynamic decodedResponse = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return {
        'success': true,
        'data': decodedResponse,
      };
    } else {
      return {
        'success': false,
        'error': decodedResponse,
      };
    }
  }

  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final Uri url = Uri.parse('$baseUrl/$endpoint');
    final http.Response response = await http.get(url);
    return await _processResponse(response);
  }

  Future<Map<String, dynamic>> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    final Uri url = Uri.parse('$baseUrl/$endpoint');
    final String jsonString = jsonEncode(body);
    final http.Response response =
        await http.post(url, body: jsonString, headers: {
      'Content-Type': 'application/json',
    });
    return await _processResponse(response);
  }

  // Similarly, you can create functions for other HTTP methods like PUT, DELETE, etc.
}

// usage this code

// Creating an instance of the ApiHandler
final ApiHandler apiHandler = ApiHandler("https://crud.teamrabbil.com/api/v1");

// Example usage for POST request
Future<void> createProduct(Map<String, dynamic> formValues) async {
  final response = await apiHandler.postRequest('CreateProduct', formValues);

  if (response['success']) {
    SuccessToast("Request is Success");
    // Handle success scenario
  } else {
    ErrorToast("Request failed");
    // Handle error scenario
  }
}

// Usage
// createProduct({
//   // your form values
// });
