import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/ui/shared/widgets/category-list.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              "Categorias",
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              height: 10,
            ),
            CategoryList(
              categories: bloc.categories,
            ),
          ],
        ),
      ),
    );
  }
}
