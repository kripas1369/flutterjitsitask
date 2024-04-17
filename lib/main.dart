import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jitsi Meet Flutter SDK Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Jitsi Meet Flutter SDK Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final meetingNameController = TextEditingController();
  final jitsiMeet = JitsiMeet();

  void join() {
    var roomName = meetingNameController.text;
    if (roomName.isNotEmpty) {
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": true,
          "startWithVideoMuted": true,
          "subject": "JitsiwithFlutter",
          "localSubject": "localJitsiwithFlutter",
        },
        featureFlags: {
          "unsaferoomwarning.enabled": false
        },
        userInfo: JitsiMeetUserInfo(
            displayName: "Flutter user",
            email: "user@example.com"
        ),
      );

      jitsiMeet.join(options);
    }
  }

  void inviteFriends() {
    // Implement functionality to invite friends here
    // This could include using email, SMS, or other messaging apps
    // You can integrate with platform-specific share functionalities
    // to send the meeting link or ID to selected contacts.
    // For example, you can use the Share package to send invitations via SMS, email, etc.
    // Example:
    // Share.share('Join my meeting: ${meetingNameController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                controller: meetingNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter meeting name',
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: join,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                ),
                child: const Text("Join"),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: inviteFriends,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                ),
                child: const Text("Invite Friends"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
