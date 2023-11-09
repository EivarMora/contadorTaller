import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Encabezado(),
    );
  }
}

class Encabezado extends StatelessWidget {
  const Encabezado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 242, 65),
        centerTitle: true,
        title: const Text('Contador'),
      ),
      body: const Containers(),
    );
  }
}

class Containers extends StatefulWidget {
  const Containers({Key? key}) : super(key: key);

  @override
  _ContainersState createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  int _i = 1, _a = 2, _b = 3, _c = 5;

  void _increment(String container) {
    setState(() {
      if (container == 'i') {
        _i += 1;
      } else if (container == 'a') {
        _a += 2;
      } else if (container == 'b') {
        _b += 3;
      } else if (container == 'c') {
        _c += 5;
      }
    });
  }

  void _reset() {
    setState(() {
      _i = 1;
      _a = 2;
      _b = 3;
      _c = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildContainer('i'),
            _buildContainer('a'),
          ],
        ),
        Row(
          children: [
            _buildContainer('b'),
            _buildContainer('c'),
          ],
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 243, 201, 75)),
            ),
            onPressed: _reset,
            child: Text('reset'),
          ),
        )
      ],
    );
  }

  Widget _buildContainer(String container) {
    int value;
    String label;

    if (container == 'i') {
      value = _i;
      label = 'incrementar';
    } else if (container == 'a') {
      value = _a;
      label = 'incrementar';
    } else if (container == 'b') {
      value = _b;
      label = 'incrementar';
    } else {
      value = _c;
      label = 'incrementar';
    }

    return Container(
      width: 200,
      height: 150,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 189, 186, 22),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 243, 201, 75)),
            ),
            onPressed: () {
              _increment(container);
            },
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
