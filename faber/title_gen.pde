

int num_title_generators = 6;
int num_subtitle_generators = 2;
String generate_title()
{
  float generate_thresholds = 100 / num_title_generators;
  float title_chance = random(0,100);
  String title = "";
  
  if(title_chance < generate_thresholds)
  {
    println("Cannabis");
    title =  generate_cannabis_title();
  }
  else if(title_chance < (generate_thresholds * 2))
  {
    title =  generate_titan_name();
  }
  else if(title_chance < (generate_thresholds * 3))
  {
    title =  generate_hebrew_god_title();
  }
  else if(title_chance < (generate_thresholds * 4))
  {
    title =  generate_crayola_title();
  }
  else if(title_chance < (generate_thresholds * 5))
  {
    title =  generate_apple_name_title();
  }
  else if(title_chance < 100)
  {
    title =  generate_passage_name();
  }
  
  float subtitle_thresholds = 100 / num_subtitle_generators;
  float subtitle_chance = random(0,100);
  if(subtitle_chance < subtitle_thresholds)
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