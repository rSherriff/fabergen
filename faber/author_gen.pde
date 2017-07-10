
int poet_num = 10;
String[] poets = new String[poet_num];

int num_author_generators = 1;

void author_setup()
{
   poets[0] = "Simon Armitage";
   poets[1] = "Wendy Cope";
   poets[2] = "Derek Walcott";
   poets[3] = "Andrew Motion";
   poets[4] = "Sylvia Plath";
   poets[5] = "Jo Shapcott";
   poets[6] = "Phillip Larkin";
   poets[7] = "Ted Hughes";
   poets[8] = "T.S. Eliot";
   poets[9] = "Seamus Heaney";
}

String generate_author()
{
  float generate_thresholds = 100 / num_title_generators;
  float author_chance = random(0,100);
  
  if(author_chance < generate_thresholds)
  {
      int poet = int(random(0, poet_num));
      return poets[poet];
  }
  else if(author_chance < (generate_thresholds * 2))
  {
  }
  
  return "";
}