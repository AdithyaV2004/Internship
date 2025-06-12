import 'package:flutter/material.dart';
import 'package:flutter_05/model/chat_model.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  List<ChatModel> myChats = [
    ChatModel(
      profileImage:
          "https://c8.alamy.com/comp/EEY2C7/poor-cute-homeless-girl-sitting-near-a-closed-shop-in-the-street-eating-EEY2C7.jpg",
      profileName: "Gloria",
      profileMessage: "Somethin in Chinese",
      messageTime: "1:09pm",
      messageCount: "1",
    ),
    ChatModel(
      profileImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvNNumCvCBYlIproGJWwU5JuLxEKo2A7qENA&s",
      profileName: "James",
      profileMessage: "Come to my nursery",
      messageTime: "1:00am",
      messageCount: "3",
    ),
    ChatModel(
      profileImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvNNumCvCBYlIproGJWwU5JuLxEKo2A7qENA&s",
      profileName: "Berly",
      profileMessage: "Plug kuthiyekkuaa",
      messageTime: "1:04am",
      messageCount: "60",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 18, 18),
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: SizedBox(
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Ask Meta AI or Search",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 41, 40, 40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          SizedBox(
            height: 400,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(myChats[index].profileImage),
                  ),
                  title: Text(
                    myChats[index].profileName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    myChats[index].profileMessage,
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        myChats[index].messageTime,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 66, 196, 77),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 66, 196, 77),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(myChats[index].messageCount),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: myChats.length,
            ),
          ),
        ],
      ),
    );
  }
}
