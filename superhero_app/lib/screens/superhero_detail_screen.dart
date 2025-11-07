import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroDetailScreen extends StatefulWidget {
  final SuperheroDetailResponse superhero;
  const SuperheroDetailScreen({super.key, required this.superhero});

  @override
  State<SuperheroDetailScreen> createState() => _SuperheroDetailScreenState();
}

class _SuperheroDetailScreenState extends State<SuperheroDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Superhero ${widget.superhero.name}")),
      body: Column(
        children: [
          /* Image.network(
            widget.superhero.url,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
          ), */
          Text(
            widget.superhero.name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            widget.superhero.biography,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          Text(
            widget.superhero.publisher,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      height: double.parse(widget.superhero.powerStats.power),
                      width: 20,
                      color: Colors.red,
                    ),
                    Text("Power"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: double.parse(
                        widget.superhero.powerStats.intelligence,
                      ),
                      width: 20,
                      color: Colors.green,
                    ),
                    Text("Intelligence"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: double.parse(
                        widget.superhero.powerStats.strength,
                      ),
                      width: 20,
                      color: Colors.amber,
                    ),
                    Text("strength"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: double.parse(widget.superhero.powerStats.speed),
                      width: 20,
                      color: Colors.deepOrangeAccent,
                    ),
                    Text("speed"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: double.parse(
                        widget.superhero.powerStats.durability,
                      ),
                      width: 20,
                      color: Colors.blue,
                    ),
                    Text("durability"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: double.parse(widget.superhero.powerStats.combat),
                      width: 20,
                      color: Colors.purple,
                    ),
                    Text("combat"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
