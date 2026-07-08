import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final userPrompt = TextEditingController();

  List<dynamic> Mess = [];

  Future<void> postChat() async {
    Uri chatsURL = Uri.parse("Local API");

    // -----------------------------------------------------------------

    final response = await http.post(
      chatsURL,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"userMess": userPrompt.text}),
    );

    final data = jsonDecode(response.body);

    setState(() {
      Mess.add(userPrompt.text);

      Mess.add(data["AI_response"]);
    });

    userPrompt.clear();

    // ---------------------------------------------------------------------
  }

  // Future<void> getChat() async {
  //   Uri chatsURL = Uri.parse("Local API");

  //   http.Response chats = await http.get(chatsURL);

  //   if (chats.statusCode == 200) {
  //     List<dynamic> data = jsonDecode(chats);

  //     setState(() {
  //       Mess = data;
  //     });
  //   } else {
  //     print(chats.statusCode);
  //   }
  // }

  // List<String> AIMess = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ChatBot"), centerTitle: true, elevation: 3),

      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              // height: 100, width: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 126, 124, 117),
              ),
              child: ListView.builder(
                itemCount: Mess.length,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(Mess[index]),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(Mess[index]),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: userPrompt,
              decoration: InputDecoration(
                border: OutlineInputBorder(),

                suffixIcon: IconButton(
                  onPressed: () async {
                    await postChat();

                    userPrompt.clear();
                  },
                  icon: Icon(Icons.send_rounded, size: 24),
                ),
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
