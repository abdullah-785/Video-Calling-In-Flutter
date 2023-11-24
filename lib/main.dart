import 'package:flutter/material.dart';
import 'api.dart';
import 'join_screen.dart';
import 'room_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Abdullah Video Calling',
      home: VideoSDKQuickStart(),
    ),
  );
}

class VideoSDKQuickStart extends StatefulWidget {
  const VideoSDKQuickStart({Key? key}) : super(key: key);

  @override
  State<VideoSDKQuickStart> createState() => _VideoSDKQuickStartState();
}

class _VideoSDKQuickStartState extends State<VideoSDKQuickStart> {
  String roomId = "";
  bool isRoomActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VideoSDK QuickStart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isRoomActive
            ? RoomScreen(
                roomId: roomId,
                token: token,
                leaveRoom: () {
                  setState(() => isRoomActive = false);
                },
              )
            : JoinScreen(
                onRoomIdChanged: (value) => roomId = value,
                onCreateRoomButtonPressed: () async {
                  roomId = await createRoom();
                  setState(() => isRoomActive = true);
                },
                onJoinRoomButtonPressed: () {
                  setState(() => isRoomActive = true);
                },
              ),
      ),
    );
  }
}
