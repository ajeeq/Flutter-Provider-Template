import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_template/Models/student_model.dart';
import 'package:flutter_provider_template/Providers/class_riverprovider.dart';
import 'Providers/class_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // declaring riverpod state providers
    final classNameState = ref.watch(classNameProvider);

    // declaring notifiers for updating riverpod states
    final ClassNameNotifier classNameController = ref.read(classNameProvider.notifier);

    
    // TODO: Whenever a NotifyListeners is triggered. This consumer will only rebuild the Text below and not the entire Widget
    print("Whenever widget is rebuild, this comment will show.");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Classname:'),
                    Text(classNameState),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('State:'),
                    // Text(context.read<ClassProvider>().classname),
                  ],
                ),
              ],
            )
            
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () async {
              // TODO: When click on floatingActionButton it will update the provider. This will trigger the Consumer above
              
              // Provider.of<ClassProvider>(context, listen: false)
              //     .setClassName("Ammar");

              // adding user course selection using Riverpod
              // classNameController.setClassName(StudentModel(
              //   name: courseNameState.toString(),
              //   age: _selectedCampus,
              // ));

              classNameController.setClassName("Ammar");






            },
            tooltip: 'Update state',
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 16),

          FloatingActionButton(
            tooltip: "Debug that shown in Snackbar",
            heroTag: "snack",
            backgroundColor: Colors.lightBlue,
            child: const Icon(Icons.miscellaneous_services),
            onPressed: () async {
              // final jsonString = selectionParameterToJson(selectionListState);

              final snackBar = SnackBar(
                content: Text("State: "),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ]
      ),
    );
  }
}
