



int max_colours = 46;

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
   bg_colours[13] = #6b2a7b; name_colours[13]= #f79422; title_colours[13]= #e30c8c;
   bg_colours[14] = #efec5c; name_colours[14]= #2e2861; title_colours[14]= #45c9f5;
   bg_colours[15] = #bdb2a7; name_colours[15]= #e54852; title_colours[15]= #424343;
   bg_colours[16] = #968036; name_colours[16]= #33433b; title_colours[16]= #efe591;
   bg_colours[17] = #dae4e2; name_colours[17]= #0c8343; title_colours[17]= #a72b40;
   bg_colours[18] = #312f2d; name_colours[18]= #dae4e2; title_colours[18]= #cadc44;
   bg_colours[19] = #82aabd; name_colours[19]= #eceef0; title_colours[19]= #ef4423;
   bg_colours[20] = #4d3a15; name_colours[20]= #fbeb78; title_colours[20]= #cf4449;
   bg_colours[21] = #13533e; name_colours[21]= #6acad0; title_colours[21]= #f7ef38;
   bg_colours[22] = #063449; name_colours[22]= #94d6da; title_colours[22]= #fef3e5;
   bg_colours[23] = #15677b; name_colours[23]= #ffffff; title_colours[23]= #203137;
   bg_colours[24] = #c2beb4; name_colours[24]= #f6efec; title_colours[24]= #ed3f97;
   bg_colours[25] = #da4040; name_colours[25]= #eff0f1; title_colours[25]= #fdddcc;
   bg_colours[26] = #112013; name_colours[26]= #94c840; title_colours[26]= #fbe30a;
   bg_colours[27] = #bebcb6; name_colours[27]= #3a3845; title_colours[27]= #d7652c;
   bg_colours[28] = #063c2c; name_colours[28]= #968036; title_colours[28]= #decd80;
   bg_colours[29] = #b0a899; name_colours[29]= #ca203c; title_colours[29]= #faea2a;
   bg_colours[30] = #fec013; name_colours[30]= #855622; title_colours[30]= #dd533a;
   bg_colours[31] = #302f83; name_colours[31]= #f0522d; title_colours[31]= #fae80c;
   bg_colours[32] = #f8f5a5; name_colours[32]= #937b2e; title_colours[32]= #d8c347;
   bg_colours[33] = #c5ba91; name_colours[33]= #99514f; title_colours[33]= #4c301e;
   bg_colours[34] = #3e3437; name_colours[34]= #bdb2a7; title_colours[34]= #ee3226;
   bg_colours[35] = #bee4dd; name_colours[35]= #7e4364; title_colours[35]= #ef3f7c;
   bg_colours[36] = #f2ebc1; name_colours[36]= #82ab9d; title_colours[36]= #1e5f5f;
   bg_colours[37] = #dec798; name_colours[37]= #1c83c6; title_colours[37]= #f99d20;
   bg_colours[38] = #f9f154; name_colours[38]= #1f9847; title_colours[38]= #ee2f3e;
   bg_colours[39] = #1d8bcc; name_colours[39]= #d2c4b8; title_colours[39]= #ec1565;
   bg_colours[40] = #ef492f; name_colours[40]= #4d4948; title_colours[40]= #fcdf07;
   bg_colours[41] = #dde5ee; name_colours[41]= #958673; title_colours[41]= #444a4f;
   bg_colours[42] = #f6e7ba; name_colours[42]= #807446; title_colours[42]= #a29a45;
   bg_colours[43] = #8e194a; name_colours[43]= #dab5d2; title_colours[43]= #fcae1b;
   bg_colours[44] = #fbe30a; name_colours[44]= #146ab4; title_colours[44]= #d72027;
   bg_colours[45] = #2b2537; name_colours[45]= #fef3e5; title_colours[45]= #c9e5f2;
   //bg_colours[] = #; name_colours[]= #; title_colours[]= #;
   
   author_setup();

   faber_logo = loadImage("logo.png");
   
   generate();
}

void draw()
{
  //One run
  if(false)
  {
      generate();
      save("output/output.png");
      exit();
  }
}

void keyPressed() 
{
  if (key == 10)
  { 
    generate();
      save("output/output.png");
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
    println("Generating new image...");
      
    int current_y = start_y;
    int colour = int(random(0, max_colours));
    fill(bg_colours[colour]);
    rect(0 + (i * book_width), 0, 0 + (i * book_width) + book_width, book_height);   
   
    fill(name_colours[colour]);
   
    println("Colour: " + colour);
    
    String str = generate_author();
    String[] res = str.split(" ");
    println("Author: " + str);

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

    println("Title: " + str);
    
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
      if(i < text.length - 1 && textWidth(text[i]) + textWidth(text[i+1]) < book_width * 2)
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
  if(string.length() == 2 || string.equals("and") || string.equals("other"))
  {
    return string;
  }
  else if(string.length() > 2)
  {
    return string.substring(0,1).toUpperCase() + string.substring(1);
  }
  else
  {
    return string.toUpperCase();
  }
}