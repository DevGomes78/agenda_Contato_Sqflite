import 'package:agenda_contatos/views/user_list.dart';
import 'package:flutter/material.dart';

import 'agenda_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB5D1FCFF),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Clinica Estetica ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              height: 550,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => UserList()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.orange,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Contatos',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AgendaPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Icon(
                              Icons.article,
                              size: 80,
                              color: Colors.red,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Agenda',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Icon(
                            Icons.account_box_rounded,
                            size: 80,
                            color: Colors.teal,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Fornecedores',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Icon(
                            Icons.receipt_sharp,
                            size: 80,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Relatorios',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
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
}
