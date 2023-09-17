import 'package:flutter/material.dart';
import 'package:flutter_unit_testing_crud/model/user_model.dart';
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
    // TODO: implement initState
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
