import 'package:flutter/material.dart';
import 'recipe.dart';

// a page that shows when each recipe is clicked
class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  // initializes _slider value to 1
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // return a screen with the title as the lable of each recipe
      appBar: AppBar(title: Text(widget.recipe.label)),
      // this prevent app for interacting with android notch or interactive areas in ios
      body: SafeArea(
          child: Column(
        children: [
          // place the image in a widget of height 300 and set the width based on the aspect ration of widget
          Card(
            elevation: 2.0,
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.recipe.imageUrl)),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            elevation: 1.0,
            child: Text(
              widget.recipe.label,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredient.length,
              itemBuilder: (context, index) {
                final ingredient = widget.recipe.ingredient[index];
                return Text(
                  '\v\r${index + 1}.  ${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}',
                  style: const TextStyle(fontFamily: 'Lucida Handwriting', fontWeight: FontWeight.w400, fontSize: 25.0),
                );
              },
            ),
          ),
          Slider(
            min: 1,
            max: 10,
            divisions: 10,
            label: '${_sliderVal * widget.recipe.serving} servings',
            value: _sliderVal.toDouble(),
            onChanged: (newvalue) {
              setState(() {
                _sliderVal = newvalue.round();
              });
            },
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          )
        ],
      )),
    );
  }
}
