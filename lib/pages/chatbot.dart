import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:io';

class PawsCareChatbot extends StatefulWidget {
  @override
  _PawsCareChatbotState createState() => _PawsCareChatbotState();
}

class _PawsCareChatbotState extends State<PawsCareChatbot> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  File? _image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/chatbot_icon.png'),
            ),
            SizedBox(width: 10),
            Text("PawsCare+ Chatbot", style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        backgroundColor: Colors.teal.shade600,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  String sender = messages[index].keys.first;
                  String message = messages[index].values.first;
                  bool isUser = sender == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.teal.shade400 : Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(20),
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
          ),
          SizedBox(height: 10),
          if (_image != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(_image!, height: 150, fit: BoxFit.cover),
              ),
            ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: pickImage,
                icon: Icon(LucideIcons.image),
                label: Text("Upload Pet Image"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(LucideIcons.camera),
                label: Text("Capture Paw"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                  backgroundColor: Colors.teal.shade600,
                  child: Icon(LucideIcons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
