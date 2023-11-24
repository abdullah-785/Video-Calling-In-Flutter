import 'dart:convert';
import 'package:http/http.dart' as http;

String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI1NDE4MTc4NC1hMjM5LTRiNWUtOWU0NS01NjUwOTg5YmE5ZDUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcwMDgzNDQyNSwiZXhwIjoxNzAzNDI2NDI1fQ.g5rWzffpx4QU73TO4jbiWJvJDbNeQFQfxrqKxPeHnsM";

Future<String> createRoom() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': token},
  );

  return json.decode(httpResponse.body)['roomId'];
}
