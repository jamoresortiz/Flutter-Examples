import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = "";
  String _email = "";
  String _pass = "";
  String _date = "";

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _buildInput(),
          Divider(),
          _buildEmail(),
          Divider(),
          _buildPass(),
          Divider(),
          _buildDate(context),
          Divider(),
          _buildPerson(),
        ],
      ),
    );
  }

  Widget _buildInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Characters ${_name.length}'),
          hintText: 'Name of the person',
          labelText: 'Name',
          helperText: 'Just the name',
          suffixIcon: Icon(Icons.accessibility_new),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
          print(_name);
        });
      },
    );
  }

  Widget _buildEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Characters ${_email.length}'),
            hintText: 'Email of the person',
            labelText: 'Email',
            helperText: 'Just the email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (value) => setState(() {
              _email = value;
              print(_email);
            }));
  }

  Widget _buildPass() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Characters ${_pass.length}'),
            hintText: 'Pass of the person',
            labelText: 'Pass',
            helperText: 'Just the pass',
            suffixIcon: Icon(Icons.lock_outline),
            icon: Icon(Icons.lock)),
        onChanged: (value) => setState(() {
              _pass = value;
              print(_pass);
            }));
  }

  Widget _buildDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Birth Date',
          labelText: 'Birth Date',
          helperText: 'Just the birth date',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES')
        );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _buildPerson() {
    return ListTile(
      title: Text('Name is $_name'),
      subtitle: Text('Email is $_email'),
    );
  }
}
