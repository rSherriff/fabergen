


int num_subtitle_generators = 2;
int cannabis_chance = 11;
int titan_chance = 10;
int god_chance = 5;
int crayola_chance = 16;
int apple_chance = 13;
int passage_chance = 5;
int tube_chance = 5;
int river_chance = 8;
int eggcorn_chance = 8;
int emoji_chance = 8;
int operation_chance = 8;
int wrestling_chance = 8;


String generate_title()
{
  float title_chance = random(0,100);
  String title = "";
  
  if(title_chance < cannabis_chance)
  {
    title =  generate_cannabis_title();
  }
  else if(title_chance < cannabis_chance + titan_chance)
  {
    title =  generate_titan_name();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance)
  {
    title =  generate_hebrew_god_title();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance  + crayola_chance)
  {
    title =  generate_crayola_title();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance + crayola_chance + apple_chance)
  {
    title =  generate_apple_name_title();
  }
  else if(title_chance <  cannabis_chance + titan_chance + god_chance  + crayola_chance + apple_chance)
  {
    title =  generate_passage_name();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance  + crayola_chance + apple_chance + tube_chance)
  {
    title = generate_tube_title();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance  + crayola_chance+apple_chance + tube_chance + river_chance)
  {
    title = generate_river_title();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance  + crayola_chance+apple_chance + tube_chance + river_chance + eggcorn_chance)
  {
    title = generate_eggcorn_title();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance  + crayola_chance+apple_chance + tube_chance + river_chance + eggcorn_chance + emoji_chance)
  {
    title = generate_emoji_title();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance  + crayola_chance+apple_chance + tube_chance + river_chance + eggcorn_chance + emoji_chance + operation_chance)
  {
    title = generate_operation_title();
  }
  else if(title_chance < cannabis_chance + titan_chance + god_chance  + crayola_chance+apple_chance + tube_chance + river_chance + eggcorn_chance + emoji_chance + operation_chance + wrestling_chance)
  {
    title = generate_wrestling_title();
  }
  
  float subtitle_thresholds = 100 / num_subtitle_generators;
  float subtitle_chance = random(0,100);
  if(subtitle_chance < 25)
  {
    String[] res = title.split(" ");
    if(res.length == 1)
    {
      title += " and other Poems";
    }
  }
  else if(subtitle_chance < subtitle_thresholds * 2)
  {
  }
  
  return title;
}

String generate_cannabis_title()
{     
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/plants/cannabis.json");
  json_data = json.getJSONArray("cannabis");
   
  int title = int(random(0, json_data.size()));
  return json_data.getString(title);
}

String generate_titan_name()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/mythology/greek_titans.json");
  json_data = json.getJSONArray("greek_titans");
   
  int title = int(random(0, json_data.size()));
  return json_data.getString(title);
}

String generate_hebrew_god_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/mythology/hebrew_god.json");
  json_data = json.getJSONArray("names");
  
  int title = int(random(0, json_data.size()));
  
  JSONObject name = json_data.getJSONObject(title);
  return name.getString("meaning");
}

String generate_crayola_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/colors/crayola.json");
  json_data = json.getJSONArray("colors");
  
  int title = int(random(0, json_data.size()));
  
  JSONObject name = json_data.getJSONObject(title);
  return name.getString("color"); 
}

String generate_apple_name_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/foods/apple_cultivars.json");
  json_data = json.getJSONArray("cultivars");
  
  int title = int(random(0, json_data.size()));
  return json_data.getString(title);
}

String generate_passage_name()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/architecture/passages.json");
  json_data = json.getJSONArray("passages");
  
  int passage_index = int(random(0, json_data.size()));
  String passage_string = json_data.getString(passage_index);
  passage_string += " to ";
  
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/art/isms.json");
  json_data = json.getJSONArray("isms");
  
  int ism_index = int(random(0, json_data.size()));
  
  passage_string += json_data.getString(passage_index);
  
  return passage_string;
  
}

String generate_tube_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/geography/london_underground_stations.json");
  json_data = json.getJSONArray("stations");
  
  int title = int(random(0, json_data.size()));
  JSONObject name = json_data.getJSONObject(title);
  return name.getString("name");
}

String generate_river_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/geography/rivers.json");
  json_data = json.getJSONArray("rivers");

  int title = int(random(0, json_data.size()));
  JSONObject name = json_data.getJSONObject(title);
  return name.getString("name");
}

String generate_eggcorn_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/words/eggcorns.json");
  json_data = json.getJSONArray("eggcorns");

  int title = int(random(0, json_data.size()));
  JSONObject name = json_data.getJSONObject(title);
  
  JSONArray corns = name.getJSONArray("mistakes");
  return corns.getString(0);
}

String generate_emoji_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/words/emoji/cute_kaomoji.json");
  json_data = json.getJSONArray("cuteKaomoji");

  int title = int(random(0, json_data.size()));
  return json_data.getString(title);
}

String generate_operation_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/governments/us_mil_operations.json");
  json_data = json.getJSONArray("operations");

  int title = int(random(0, json_data.size()));
  return json_data.getString(title);
}

String generate_wrestling_title()
{
  json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/games/wrestling_moves.json");
  json_data = json.getJSONArray("moves");

  String title;
  String[] list;
  
  do
  {
     int title_index = int(random(0, json_data.size()));
     title = json_data.getString(title_index);
     list= split(title, ' ');
  }
  while(title.length() > 0 && list.length > 0 && list.length > 3);
  
  return title;
}