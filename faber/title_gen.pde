

int num_title_generators = 1;
String generate_title()
{
  float generate_thresholds = 100 / num_title_generators;
  float title_chance = random(0,100);
  
  if(title_chance < generate_thresholds)
  {
    return generate_cannabis_title();
  }
  else if(title_chance < (generate_thresholds * 2))
  {
  }
  
  return "";
}

String generate_cannabis_title()
{
  int title = int(random(0, json_data.size()));
  return json_data.getString(title);
}