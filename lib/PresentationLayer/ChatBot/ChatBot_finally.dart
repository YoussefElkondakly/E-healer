import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Messages.dart';

class Home_Chatbot extends StatefulWidget {
  const Home_Chatbot({Key? key}) : super(key: key);
  @override
  _Home_ChatbotState createState() => _Home_ChatbotState();
}
class _Home_ChatbotState extends State<Home_Chatbot> {
  late DialogFlowtter dialogFlowtter;
  var _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  @override
  void initState() {
    DialogAuthCredentials.fromFile("assets/ehealerbot.json")
        .then((credentials) {
      dialogFlowtter = DialogFlowtter(credentials: credentials);
    });
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.h,
        actions: <Widget>[
          Image.asset(
            "assets/Group.png",
          ),
          SizedBox(
            width: 8.w,
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Image.asset(
            "assets/img_1.png",
            width: 54.w,
            height: 54.h,
          ),
        ),
        leadingWidth: 70,
        backgroundColor: Colors.white,

      ),
      body: Stack(
        children: [
          Positioned(
            left: -129,
            top: -63,
            child: Container(
              width: 216.w,
              height: 216.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(10, 156, 216, 0.30196078431372547),
                    blurRadius: 143,
                    spreadRadius: 90,
                    //New
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 300,
            top: 659,
            child: Container(
              width: 216.w,
              height: 216.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(10, 156, 216, 0.30196078431372547),
                    blurRadius: 143,
                    spreadRadius: 90,
                    //New
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: MessagesScreen(messages: messages),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Color.fromARGB(20, 0, 0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xffffffff),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: '             Type Something',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          controller: _controller,
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                      IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Color.fromRGBO(10, 156, 216, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
// title: Text(textAlign:TextAlign.start,
//   'Medical Assistant',
//   style: TextStyle(
//     color: Colors.black,
//   ),
// ),

class ChatBot_final extends StatelessWidget {
  const ChatBot_final({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      theme: ThemeData(brightness: Brightness.light),
      home: Home_Chatbot(),
      debugShowCheckedModeBanner: false,
    );
  }
}