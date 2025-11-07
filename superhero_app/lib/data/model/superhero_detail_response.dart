class SuperheroDetailResponse {
  final String id;
  final String name;
  final String url;
  final String biography;
  final String publisher;
  final PowerStatsResponse powerStats;

  SuperheroDetailResponse({required this.id, 
                          required this.name, 
                          required this.url, 
                          required this.biography, 
                          required this.publisher,
                          required this.powerStats});

  factory SuperheroDetailResponse.fromJson(Map<String, dynamic> json){
    return SuperheroDetailResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"], 
      biography: json["biography"]["full-name"], 
      publisher: json["biography"]["publisher"], 
      powerStats: PowerStatsResponse.fromJson(json["powerstats"]), 
    );
  }
}

class PowerStatsResponse {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  PowerStatsResponse({required this.intelligence, 
                      required this.strength, 
                      required this.speed, 
                      required this.durability, 
                      required this.power, 
                      required this.combat});

  factory PowerStatsResponse.fromJson(Map<String, dynamic> json){
    return PowerStatsResponse(
      intelligence: json["intelligence"],
      strength: json["strength"],
      speed: json["speed"],
      durability: json["durability"],
      power: json["power"],
      combat: json["combat"],
    );
  }
}
 