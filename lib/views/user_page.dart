import 'package:agenda_contatos/models/contact_models.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  Contact? contact;

  UserPage({this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB5D1FCFF),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            contact!.name.toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ContactCard(),
          ],
        ));
  }

  ContactCard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 430,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.redAccent,
                        ),
                        Text(
                          '    ${contact!.name.toString()}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color: Colors.deepPurple),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.mail,
                          size: 60,
                          color: Colors.lightBlue,
                        ),
                        Text(
                          '    ${contact!.email.toString()}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color: Colors.deepPurple),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 60,
                          color: Colors.deepPurple,
                        ),
                        Text(
                          '    ${contact!.phone.toString()}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color: Colors.deepPurple),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                              height: 60,
                              child: Image.asset('images/Whats.png')),
                        ),
                        Text(
                          '    ${contact!.phone.toString()}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
