import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';
import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/screens/superhero_detail_screen.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {
  Future<SuperheroResponse?>? _superheroInfo;
  final _repository = Repository();
  bool _isTextEmpty = true;
  bool imageReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Superhero search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Buscar a un super héroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
              onChanged: (text){
                setState(() {
                  _isTextEmpty = text.isEmpty;
                  _superheroInfo = _repository.fetchSuperheroInfo(text);
                });
                //print("El texto es $_superheroInfo");
              },            
            ),
          ),
          bodyList(_isTextEmpty)
        ],
      ),
    );
  }

  FutureBuilder<SuperheroResponse?> bodyList(bool isTextEmpty) {
    return FutureBuilder(
          future: _superheroInfo, 
          builder: (context, snapshot){    
            if(isTextEmpty){
              return Center(child: Text("Ingresa el nombre de un superhéroe"));
            }                      
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }else if(snapshot.hasData){
              var superheroList = snapshot.data?.results;                
              return Expanded(                 
                child: ListView.builder(                    
                  itemCount: superheroList?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (superheroList != null)
                    {
                      return itemSuperHero(superheroList[index]);
                    }else{
                      return Text("Error");
                    }
                  }),
              );
          }else{
            return Text("No hay datos");
          }
        });
  }

  Padding itemSuperHero(SuperheroDetailResponse item) => Padding(
    padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
    child: GestureDetector(
      onTap: () => Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => SuperheroDetailScreen(superhero: item),
        )),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.red) ,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Text(item.url),
              // child: Image.network(_getImage(item.url), 
              //               height: 250, 
              //               width: double.infinity,
              //               fit: BoxFit.cover,
              //               alignment: Alignment(0, -0.6),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.name, 
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300, color: Colors.white),),
            )
          ],
        ),
      ),
    ),
  );

  dynamic _getImage(String url) {
    try {
      return imageReady
          ? Image.network(
              "/Users/juanmiguelperez/develop/super_hero/super_hero/superhero_app/lib/image/error.jpg", //url,
              height: 96.0,
              width: 96.0,
              fit: BoxFit.cover)
          : Image.network(
              "/Users/juanmiguelperez/develop/super_hero/super_hero/superhero_app/lib/image/error.jpg",
              height: 96.0,
              width: 96.0,
              fit: BoxFit.cover);//Icon(Icons.print);
    } catch (e) {
      return Icon(Icons.print);
    }
  }
}
