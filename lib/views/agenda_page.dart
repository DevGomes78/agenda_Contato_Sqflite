import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:agenda_contatos/models/contact_models.dart';
import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  Contact? contact;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: FutureBuilder<List<Contact>>(
            future: ContactHelper().getAllContacts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return SizedBox(
                width: 280,
                child: DropdownButton<Contact>(
                  isExpanded: true,
                  icon: Icon(Icons.person),
                  items: snapshot.data!
                      .map((contact) => DropdownMenuItem<Contact>(
                            child: Text(contact.name.toString()),
                            value: contact,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      value = this.contact;
                    });
                  },
                  //value: _currentUser,
                  hint: Text('Selecione Contato'),
                ),
              );
            }),
      ),
    );
  }
}
