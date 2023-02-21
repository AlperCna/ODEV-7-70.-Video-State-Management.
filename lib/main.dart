import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Sayac.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Sayac>(
          create: (context) => Sayac(0),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, Sayac mySayac, widget) => Scaffold(
        appBar: AppBar(
          title: Text("Provider Deneme"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sayaç değeri: " + mySayac.sayac.toString()),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(12),
                    )),
                child: Text("Sayacı arttır!"),
                onPressed: () {
                  mySayac.arttir();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
