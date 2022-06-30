import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_app/ui/home_view_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('To do List')),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(padding: EdgeInsets.all(20), child: TextField(controller: nameCont)),
          Padding(padding: EdgeInsets.all(20), child: TextField(controller: phoneCont)),
          ElevatedButton(
              onPressed: () {
                viewModel.add(nameCont.text, phoneCont.text);
              },
              child: Text('Add')),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 3 / 4,
            child: Observer(builder: (_) {
              return ListView.builder(
                itemCount: viewModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(viewModel.myList[index]['name']),
                    subtitle: Text(viewModel.myList[index]['phone']),
                    trailing: IconButton(onPressed: (() => viewModel.remove(index)), icon: Icon(Icons.delete)),
                  );
                },
              );
            }),
          ),
        ]),
      ),
    );
  }
}
