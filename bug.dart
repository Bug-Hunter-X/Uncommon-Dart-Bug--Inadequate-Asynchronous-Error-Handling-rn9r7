```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle the response here
      final jsonData = jsonDecode(response.body);
      // Access and use jsonData
    } else {
      // Handle non-200 status codes appropriately.  Don't just throw.
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // This is a broad catch, and it is often bad practice.
    // Ideally catch more specific exceptions like SocketException or FormatException
    print('Error: $e'); // Avoid using print in production. Log instead.
    rethrow; // This re-throws the exception up the call stack
  }
}
```