import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_app/layouts/cubit.dart';
import 'package:sqflite_app/layouts/states.dart';


class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context,state){},
        builder: (context , state ) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Hello Bloc"),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text('minus'),
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: Text('plus'),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      );

  }
}
