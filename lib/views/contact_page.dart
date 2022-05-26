import 'dart:async';
import 'package:agenda_contatos/components/text_form_widget.dart';
import 'package:agenda_contatos/models/contact_models.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  Contact? _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
      _nameController.text = _editedContact!.name!;
      _emailController.text = _editedContact!.email!;
      _phoneController.text = _editedContact!.phone!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        backgroundColor: Colors.white,
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
            _editedContact!.name ?? "Novo Contato",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                _editNome(),
                SizedBox(height: 10),
                _editiEmail(),
                SizedBox(height: 10),
                _editTelefone(),
                SizedBox(height: 20),
                btnSave(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  btnSave() {
    return GestureDetector(
      onTap: () {
        if (_editedContact!.name != null && _editedContact!.name!.isNotEmpty) {
          Navigator.pop(context, _editedContact);
        } else {
          FocusScope.of(context).requestFocus(_nameFocus);
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.deepPurple,
        ),
        child: Text(
          'Salvar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  _editTelefone() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        "Telefone",
        Icon(Icons.phone, color: Colors.deepPurple),
        controller: _phoneController,
        onChanged: (text) {
          _userEdited = true;
          _editedContact!.phone = text;
        },
      ),
    );
  }

  _editiEmail() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        "Email",
        Icon(Icons.email, color: Colors.deepPurple),
        controller: _emailController,
        onChanged: (text) {
          _userEdited = true;
          _editedContact!.email = text;
        },
      ),
    );
  }

  _editNome() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        "Nome",
        Icon(Icons.people, color: Colors.deepPurple),
        controller: _nameController,
        onChanged: (text) {
          _userEdited = true;
          setState(() {
            _editedContact!.name = text;
          });
        },
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: [
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
