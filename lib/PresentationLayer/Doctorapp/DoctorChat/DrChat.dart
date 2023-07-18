import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

import 'chatMessageMode.dart';


class Dr_chat extends StatelessWidget {
  const Dr_chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Doctor',
      theme: ThemeData(brightness: Brightness.light),
      home: Dr_chat(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class DrChat extends StatefulWidget {

  @override
  State<DrChat> createState() => _DrChatState();
}

class _DrChatState extends State<DrChat> {
  final TextEditingController _controller = TextEditingController();
  //List<Map<String, dynamic>> messages = [];
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello Doctor", messageType:  "receiver"),
    ChatMessage(messageContent: "I'm not feel well", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Heba", messageType: "sender"),
    ChatMessage(messageContent: "What do you feel?", messageType: "sender"),
    ChatMessage(messageContent: "I feel an ache in the stomach", messageType: "receiver"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[

                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://i.ibb.co/StvxmBw/IMG-20221020-1232192.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Heba Osama",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(

          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Flexible(
                    child:ListView.builder(
                      itemCount: messages.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                          child: Align(
                            alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-2, 0),
                    blurRadius: 5,
                  ),
                ]),
                child: Row(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Enter Message',
                          border: InputBorder.none,
                        ),
                        controller: _controller,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Color(0xff3E8DF3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage} as ChatMessage);
  }
}