// Helper function to manually parse the Map-like string payload
Map<String, dynamic> parseMapFromString(String payload) {
  // Remove the curly braces and split key-value pairs
  final mapString = payload.substring(1, payload.length - 1);
  final pairs = mapString.split(', ');

  final Map<String, dynamic> map = {};
  for (var pair in pairs) {
    final keyValue = pair.split(': ');
    map[keyValue[0]] = keyValue[1]; // Add the key-value pair to the map
  }

  return map;
}
