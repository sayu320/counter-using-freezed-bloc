import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project_3/bloc/counter_bloc.dart';


Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'My Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Flutter Demo Home page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  
 @override
 Widget build(BuildContext context) {
  log('build()-> called');
  return Scaffold(
    appBar: AppBar(
      title: Text('title'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed this button many times:',
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              log('BlocBuilder()->called');
              return Text(
                '${state.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          )
        ],
      ),
    ),
    
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
           tooltip: 'Decrement',
          onPressed: (){
          context.read<CounterBloc>().add(Decrement());
        },
       
        child: const Icon(Icons.remove),
        ),
      

        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(Increment());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    ),
  );
}
}