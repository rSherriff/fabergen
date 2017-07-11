

int num_title_generators = 2;
String generate_title()
{
  float generate_thresholds = 100 / num_title_generators;
  float title_chance = random(0,100);
  
  if(title_chance < generate_thresholds)
  {
    //return generate_cannabis_title();
  }
  if(title_chance < (generate_thresholds * 2))
  {
    //return generate_titan_name();
  }
  if(title_chance < (generate_thresholds * 3))
  {
    return generate_hebrew_god_title();
  }
  
  return "";
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