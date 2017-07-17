
int poet_num = 0;
ArrayList<String> poets = new ArrayList<String>();

int num_author_generators = 1;

void author_setup()
{
   poets.add("Simon Armitage");
   poets.add("Wendy Cope");
   poets.add("Derek Walcott");
   poets.add("Andrew Motion");
   poets.add("Sylvia Plath");
   poets.add("Jo Shapcott");
   poets.add("Phillip Larkin");
   poets.add("Ted Hughes");
   poets.add("T.S. Eliot");
   poets.add("Seamus Heaney");
   poets.add("Wilfred Owen");
   poets.add("Siegfried Sasson");
   poets.add("Robert Graves");
   poets.add("Dylan Thomas");
   poets.add("David Harsent");
   poets.add("Kingsley Amis");
   poets.add("Harold Pinter");
   poets.add("Hugo Williams");
   poets.add("A.E. Housman");
   poets.add("William Morris");
   poets.add("John Ruskin");
   poets.add("J.R.R. Tolkien");
   poets.add("Edith Sitwell");
   poets.add("Wilfred Owen");
   poets.add("Ezra Pound");
   poets.add("Jo Shapcott");
   poets.add("Thom Gunn");
   poets.add("August Kleinzahler");
   poets.add("Robert Lowell");
   poets.add("Hugo Williams");
   poets.add("Douglas Dunn");
   poets.add("W.H. Auden");
   poets.add("Alfred Brendel");
   poets.add("Don Paterson");
   poets.add("James Joyce");
   
   //poets.add("");
   
   poet_num = poets.size();
}

String generate_author()
{
  float generate_thresholds = 100 / num_author_generators;
  float author_chance = random(0,100);
  
  if(author_chance < generate_thresholds)
  {
      int poet = int(random(0, poet_num));
      return poets.get(poet);
  }
  else if(author_chance < (generate_thresholds * 2))
  {
  }
  
  return "";
}