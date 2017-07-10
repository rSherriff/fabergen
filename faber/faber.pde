



int max_colours = 13;

color[] bg_colours = new color[max_colours];
color[] name_colours = new color[max_colours];
color[] title_colours = new color[max_colours];

int line_space = 100;
int start_y = 100;

PImage faber_logo;
JSONArray json_data;
JSONObject json;

void setup()
{
   colorMode(HSB);
   size(1200, 600);
   
   PFont font;
   font = createFont("times.ttf", 100);
   background(0);
   textFont(font);   
   
   json = loadJSONObject("https://raw.githubusercontent.com/dariusk/corpora/master/data/plants/cannabis.json");
   json_data = json.getJSONArray("cannabis");
      
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
  }
}

void generate()
{
  for(int i = 0; i < 3; i++)
  {
      int colour = int(random(0, max_colours));
      int lines = 0;
      fill(bg_colours[colour]);
      rect(0 + (i * 400), 0, 0 + (i * 400) +400, 600);   
     
      fill(name_colours[colour]);
     
      String str = generate_author();
      String[] res = str.split(" ");
  
      for (String j : res) 
      {  
        text(j, 10 + (i * 400), start_y + (line_space * lines++));
      }
     
      fill(title_colours[colour]);
      str = generate_title();
      res = str.split(" ");
  
      for (String j : res) 
      {  
        text(j, 10 + (i * 400), start_y + (line_space * lines++));
      }  
  }
}