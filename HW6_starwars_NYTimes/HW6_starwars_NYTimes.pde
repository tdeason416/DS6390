/*  MSDS 6390-402  Assignment #6
    Travis Deason / Jeff Lancon
    
    Loading JSON data via NY Times API URL and displaying results

  Sources:
  https://www.youtube.com/watch?v=fUkF-YLLXeg
  http://api.nytimes.com/svc/search/v2/articlesearch.json?q=processing&sort=newest&api-key=65c45b90098443e382456171886f4259
*/

String [] headline = new String[10];
String scrollTxt;
float y =0;


void setup() {
  /* The URL for the JSON data   
  http://api.nytimes.com/svc/search/v2/articlesearch.json?q=processing&sort=newest&api-key=65c45b90098443e382456171886f4259
  */
  String apiKey = "65c45b90098443e382456171886f4259";
  String url = "http://api.nytimes.com/svc/search/v2/articlesearch.json";
  String query = "?q=processing&sort=newest";
    
  
  // Load the JSON document and parse headline data
  JSONObject json = loadJSONObject(url+query+"&api-key="+apiKey);
  for (int i = 0; i < 10; i = i+1) {
    headline[i] = json.getJSONObject("response").getJSONArray("docs").getJSONObject(i).getJSONObject("headline").getString("main");
  }
  /* Saving headline data to text file: Saving to file in case user not able
     to retrieve data.
  */
  saveStrings("/data/NYTimesFile.txt", headline);

  
  //  size(1200,600, P3D);
  fullScreen(P3D);
  // Loading headline data array from file and joining them together
  String[] lines = loadStrings("NYTimesFile.txt");
  scrollTxt = join(lines,'\n');
  y = height/2;
  // Proper front for StarWars scrolling text
  PFont myFont = createFont("NEW GOTHIC MT", 22);
  textFont(myFont);
}

void draw() {
  background(0);
  fill(238,213,75);  
  translate(width/2,height/2); 
  textSize(width*0.04); // Text size relative to screen width
  textAlign(CENTER);
  rotateX(PI/4);  // Rotating text along X axis (give illusion of tilting)
  
  // Creating text box
  float w = width*0.7;
  text(scrollTxt,-w/2,y,w,height*12);
  
  y-=1.2;  // Scroll speed adjust
}
