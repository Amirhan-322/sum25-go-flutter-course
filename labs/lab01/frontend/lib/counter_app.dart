import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _increment() {
    setState((){
      _counter+=1;
    });
    // TODO: Implement increment
  }

  void _decrement() {
    // TODO: Implement decrement
    setState((){
      _counter-=1;
    });
  }

  void _reset() {
    // TODO: Implement reset
    setState((){
      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implement counter UI
    return Center(
      child: Container(
        
      
        width: 180,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 225, 199, 0),
              Color.fromARGB(255, 221, 0, 213),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          border: Border.all(
            color: Color.fromARGB(255, 39, 39, 39)
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            const Text("Counter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _decrement, 
                  icon: Icon(Icons.remove, color: Colors.white)
                ),
                SizedBox(
                  width: 50,
                  child: Center(
                    child: Text("$_counter",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30
                      )
                    ),
                  ),
                ),
                IconButton(
                onPressed: _increment, 
                icon: Icon(Icons.add, color: Colors.white)
              )
              ],
            ),
            IconButton(
              onPressed: _reset, 
              icon: Icon(Icons.refresh, color: Colors.white)
            )
          ],
        ),
      ),
    );
  }
}
