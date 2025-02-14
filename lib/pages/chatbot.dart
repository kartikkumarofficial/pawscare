import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PawsCareChatbot extends StatefulWidget {
  @override
  _PawsCareChatbotState createState() => _PawsCareChatbotState();
}

class _PawsCareChatbotState extends State<PawsCareChatbot> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  void sendMessage(String text) {
    if (text.isEmpty) return;
    setState(() {
      messages.add({"user": text});
      messages.add({"bot": getBotResponse(text)});
    });
    _controller.clear();
  }

  String getBotResponse(String query) {
    if (query.toLowerCase().contains("adopt")) {
      return "Looking for a pet? I can help! What kind of pet are you interested in?";
    } else if (query.toLowerCase().contains("health")) {
      return "Tell me your pet’s symptoms, and I'll suggest possible conditions and care tips.";
    } else if (query.toLowerCase().contains("rescue")) {
      return "If you found an injured pet, I can connect you with local rescue services.";
    } else if (query.toLowerCase().contains("lost")) {
      return "Upload a picture of your lost pet, and I'll try to find matches in our database.";
    } else if (query.toLowerCase().contains("behavior")) {
      return "Describe your pet’s behavior, and I’ll analyze patterns to provide insights.";
    } else {
      return "I’m here to help with pet adoption, health tracking, rescue, and more!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/chatbot_icon.png'),
            ),
            SizedBox(width: 10),
            Text("PawsCare+ Chatbot")
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  String sender = messages[index].keys.first;
                  String message = messages[index].values.first;
                  bool isUser = sender == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.teal.shade700 : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(isUser ? 20 : 0),
                          topRight: Radius.circular(isUser ? 0 : 20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(LucideIcons.image),
                  label: Text("Upload Pet Image"),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(LucideIcons.camera),
                  label: Text("Capture Paw"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Ask something...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () => sendMessage(_controller.text),
                    backgroundColor: Colors.teal.shade700,
                    child: Icon(LucideIcons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}