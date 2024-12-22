```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      // Handle specific error scenarios based on status codes
      print('Request failed with status: ${response.statusCode}.');
      // Optionally throw a custom exception for better error handling upstream.
      // throw CustomApiException('Request failed with status: ${response.statusCode}');
      return null; // Or throw an exception, based on your need
    } 
  } on http.ClientException catch (e) {
    print('Network error: $e');
    return null; // Or handle it in a more specific way.
  } on FormatException catch (e) {
    print('JSON format error: $e');
    return null; // Or handle it in a more specific way.
  } catch (e) {
    print('An unexpected error occurred: $e');
    return null; // Or handle it in a more specific way.
  }
}
```