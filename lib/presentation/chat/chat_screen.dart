import 'package:flutter/material.dart';

const String urlImage =
    'https://images.pexels.com/photos/18129003/pexels-photo-18129003/free-photo-of-hombre-retrato-sonriente-mayor.jpeg?auto=compress&cs=tinysrgb&w=60&h=60&dpr=1';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(urlImage),
            // backgroundColor: Colors.blue,
            // child: Icon(Icons.person),
          ),
        ),
        title: const Text('Joselito Linares'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Permite que el area de trabajo no interfiera en el notch de iOS o en los espacios de botones dinámicos
      // top: false,  // comerse el area superior hasta lo más alto posible
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                // Ocupar todo el area posible
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(
                  'Indice: ${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ));
              },
            )),
            Text('Hola'),
            Text('Mundo')
          ],
        ),
      ),
    );
  }
}
