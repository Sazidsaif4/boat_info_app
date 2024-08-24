import 'package:flutter/material.dart';
import 'boat.dart';

void main() {
  runApp(BoatInfoApp());
}

class BoatInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boat Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BoatListScreen(),
    );
  }
}

class BoatListScreen extends StatefulWidget {
  @override
  _BoatListScreenState createState() => _BoatListScreenState();
}

class _BoatListScreenState extends State<BoatListScreen> {
  final List<Boat> _boats = [];

  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _lengthController = TextEditingController();

  void _addBoat() {
    final name = _nameController.text;
    final type = _typeController.text;
    final length = int.tryParse(_lengthController.text);

    if (name.isEmpty || type.isEmpty || length == null) {
      return;
    }

    setState(() {
      _boats.add(Boat(name: name, type: type, length: length));
    });

    _nameController.clear();
    _typeController.clear();
    _lengthController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boat Info'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Boat Name'),
                ),
                TextField(
                  controller: _typeController,
                  decoration: InputDecoration(labelText: 'Boat Type'),
                ),
                TextField(
                  controller: _lengthController,
                  decoration: InputDecoration(labelText: 'Boat Length (feet)'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addBoat,
                  child: Text('Add Boat'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _boats.length,
              itemBuilder: (ctx, index) {
                final boat = _boats[index];
                return ListTile(
                  title: Text(boat.name),
                  subtitle: Text('${boat.type}, ${boat.length} feet'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
