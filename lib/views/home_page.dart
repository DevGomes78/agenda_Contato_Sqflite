import 'package:agenda_contatos/views/user_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 160,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
            ),
            gradient: LinearGradient(
                colors: [(Colors.white), (Colors.pink)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text('Clinica Estetica '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 580,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserList()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreen,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white60,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Contatos',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(
                          Icons.article,
                          size: 80,
                          color: Colors.white60,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Agenda',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(
                          Icons.account_box_rounded,
                          size: 80,
                          color: Colors.white60,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Fornecedores',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(
                          Icons.receipt_sharp,
                          size: 80,
                          color: Colors.white60,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Relatorios',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              title: Text("Minha conta")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.article, size: 30),
              title: Text("Minha Agenda")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
                  title: Text("Meus Contatos")
          ),
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
