import 'package:flutter/material.dart';

import '../bloc/bloc_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void showSnackBar(BuildContext context, bool isIncrement) {
    var snackContent = "";
    if (isIncrement) {
      snackContent = "Successfully incremented";
    } else {
      snackContent = "Successfully decremented";
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackContent),
      duration: Duration(milliseconds: 300),
    ));
  }

  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter value: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                BlocConsumer<CounterBloc, CounterState>(
                  listener: (context, state) {
                    showSnackBar(context, state is IncrementState);
                  },
                  builder: (context, state) {
                    return Text(
                      '${state.counterValue}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterDecrementEvent()),
                      icon: Icon(Icons.remove),
                      label: Text('Decrease'),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterIncrementEvent()),
                      icon: Icon(Icons.add),
                      label: Text('Increase'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
