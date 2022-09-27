import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.label)),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage(widget.recipe.imageUrl)),
          ),
          const SizedBox(height: 4),
          Text(
            widget.recipe.label,
            style: const TextStyle(fontSize: 18),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredient.length,
              itemBuilder: (context, index) {
                final ingredient = widget.recipe.ingredient[index];
                return Text(
                  '\v\r${index + 1}.  ${ingredient.quantity} ${ingredient.measure} ${ingredient.name}',
                  style: const TextStyle(fontFamily: 'Lucida Handwriting', fontWeight: FontWeight.w400, fontSize: 25.0),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
