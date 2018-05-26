


String generate_author()
{  
  json = loadJSONObject("poets.json");
  JSONObject results = json.getJSONObject("results");
  JSONArray bindings = results.getJSONArray("bindings");
  
  int index = int(random(0, bindings.size()));
  JSONObject name = bindings.getJSONObject(index);
  
  print(name);
  
  return name.getJSONObject("name").getString("value");
}