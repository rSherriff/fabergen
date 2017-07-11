



int max_colours = 13;

color[] bg_colours = new color[max_colours];
color[] name_colours = new color[max_colours];
color[] title_colours = new color[max_colours];

int default_line_space = 100;
int line_space = default_line_space;
int start_y = 0;

PImage faber_logo;
JSONArray json_data;
JSONObject json;

int book_width = 400;
int book_height = 600;

int default_font_size = 100;
int margin_size = 10;
int num_books = 1;

void setup()
{
   colorMode(HSB);
   
    surface.setResizable(true);
    surface.setSize(book_width * num_books, book_height);
   
   PFont font;
   font = createFont("times.ttf", default_font_size);
   background(0);
   textFont(font);   
      
   bg_colours[0] = #f54222; name_colours[0]= #925840;  title_colours[0]= #face63;
   bg_colours[1] = #fda13a; name_colours[1]= #f15d37;  title_colours[1]= #e4f1e8;
   bg_colours[2] = #f7dd6c; name_colours[2]= #f2573b;  title_colours[2]= #a63837;
   bg_colours[3] = #5b3c8c; name_colours[3]= #d6b54a;  title_colours[3]= #cf5e3e;
   bg_colours[4] = #334d5e; name_colours[4]= #f1f1e7;  title_colours[4]= #e93639;
   bg_colours[5] = #949ecf; name_colours[5]= #edd74e;  title_colours[5]= #bb1112;
   bg_colours[6] = #979fd0; name_colours[6]= #e5e7d2;  title_colours[6]= #9c8c7d;
   bg_colours[7] = #791924; name_colours[7]= #d3a62f;  title_colours[7]= #926b2a;
   bg_colours[8] = #3b221b; name_colours[8]= #dce5e4;  title_colours[8]= #e05133;
   bg_colours[9] = #5092aa; name_colours[9]= #e8c1a0;  title_colours[9]= #e8e3e7;
   bg_colours[10] = #015cb9; name_colours[10]= #e8c1a0; title_colours[10]= #fff6ec;
   bg_colours[11] = #3b431a; name_colours[11]= #e4e3ce; title_colours[11]= #a27c33;
   bg_colours[12] = #dcd674; name_colours[12]= #2c5338; title_colours[12]= #817f08;
   
   author_setup();

   faber_logo = loadImage("logo.png");
   
   generate();
   

}

void draw()
{
}

void keyPressed() 
{
  if (key == 10)
  { 
    generate();
       save("output.png");
  }
  if(key == TAB)
  {
    println("Generating sample...");
    String words = "";
    for(int i = 0; i < 50; i++)
    {
      words += generate_passage_name() + ',';
    }
    String[] list = split(words, ',');
    saveStrings("titles.txt", list);
    println("Finished sample.");
  }
}

void generate()
{
  for(int i = 0; i < num_books; i++)
  {
    int current_y = start_y;
    int colour = int(random(0, max_colours));
    fill(bg_colours[colour]);
    rect(0 + (i * book_width), 0, 0 + (i * book_width) + book_width, book_height);   
   
    fill(name_colours[colour]);
   
    String str = generate_author();
    String[] res = str.split(" ");

    get_best_font_size(res);
    for (String j : res) 
    {  
      current_y += line_space;
      text(j, margin_size + (i * book_width), current_y);
    }
    textSize(default_font_size);
    line_space = default_line_space;
   
    fill(title_colours[colour]);
    
    str = generate_title();
    res = str.split(" ");

    res = format_text(res);
    current_y += 15 + textAscent();
    text(res[0], margin_size + (i * book_width), current_y);
    for (int j = 1; j < res.length; j++) 
    {  
       current_y += line_space;
      text(res[j], margin_size + (i * book_width), current_y);
    }
    
    textSize(default_font_size); 
    line_space = default_line_space;
  }
}

String[] format_text(String[] text)
{
  ArrayList<String> temp_text = new ArrayList<String>();
  boolean added_this_word = false;
  
  if(text.length >=3)
  {
    for(int i = 0; i < text.length; i++)
    {
      if(added_this_word)
      {
        added_this_word = false;
        continue;
      }
      //If the length of a two words in a row is less than the width of the book and a quater, put them on the same line
      if(i < text.length - 1 && textWidth(text[i]) + textWidth(text[i+1]) < book_width * 1.25)
      {
        temp_text.add(upper_case_first_character(text[i]) + " " + upper_case_first_character(text[i+1]));
        added_this_word = true;
      }
      else
      {
        temp_text.add(upper_case_first_character(text[i]));
      }
    }
  }
  else
  {
    for(int i = 0; i < text.length; i++)
    {
       temp_text.add(upper_case_first_character(text[i]));
    }
  }

  get_best_font_size(temp_text);
  
  String[] return_array = new String[temp_text.size()];
  for(int i = 0; i < temp_text.size(); i++)
  {
    return_array[i] = temp_text.get(i);
  }
    
  return return_array;
}

void get_best_font_size(String[] text)
{    
  int font_size = default_font_size;
  for(String word : text)
  {
    //println("Processing word: " + word + " Length: " + textWidth(word));
    while(textWidth(word) > (book_width - (margin_size * 2)))
    {
      textSize(font_size--);
      line_space--;
      //println("Font Size: " + font_size);
    }
  }
}

void get_best_font_size(ArrayList<String> text)
{    
  int font_size = default_font_size;
  for(String word : text)
  {
    //println("Processing word: " + word + " Length: " + textWidth(word));
    while(textWidth(word) > (book_width - (margin_size * 2)))
    {
      textSize(font_size--);
      line_space--;
      //println("Font Size: " + font_size);
    }
  }
}

String upper_case_first_character(String string)
{
  if(string.length() > 2)
  {
    return string.substring(0,1).toUpperCase() + string.substring(1);
  }
  else if(string.length() ==2)
  {
    return string;
  }
  else
  {
    return string.toUpperCase();
  }
}