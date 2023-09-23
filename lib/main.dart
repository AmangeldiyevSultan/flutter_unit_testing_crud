import 'package:flutter/material.dart';
import 'package:flutter_unit_testing_crud/user_repository.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}  

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  UserRepository userRepository = UserRepository(Client()); 

  @override 
  void initState() {
    
    super.initState();
    // createModel(); 
    // getModel();    
    // updateModel();
    // deleteModel(); 
  
  } 
 
void createModel ( ) async{
  await  userRepository.createUser('sula', 'sula@mail');
  }

  void updateModel ( ) async{
  await  userRepository.updateUser('sula', 'sultan');
  } 

  void deleteModel ( ) async{
  await  userRepository.deleteUser('sultan');
  }

  void getModel ( ) async{
 await  userRepository.getUser();
  }


 
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final _usernameContoller = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameContoller.dispose();
    _passwordController.dispose();
  }
 

  void _login() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _usernameContoller,
            ),
            TextFormField(
              controller: _passwordController,
            ),
            ElevatedButton(onPressed: _login, child: const Text('press'),)
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(); 
  }
}
