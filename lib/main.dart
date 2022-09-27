import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';
import 'package:recipes/recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

// TODO: Add dark and light theme
class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title is a description that the device uses to  identify the app
      // the ui wont display this
      title: 'Recipe Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  final Color _currentColor = Colors.white;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: buildRecipeCard(Recipe.samples[index]),
            onTap: () => setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => RecipeDetail(recipe: Recipe.samples[index])),
                  ));
            }),
          );
        },
      )),
    );
  }

// apps component
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      color: widget._currentColor,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          const SizedBox(height: 14.0),
          Text(
            recipe.label,
            style: const TextStyle(fontFamily: 'Palatino', fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
        ]),
      ),
    );
  }
}
