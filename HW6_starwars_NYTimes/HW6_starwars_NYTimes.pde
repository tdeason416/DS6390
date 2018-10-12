/*  MSDS 6390-402  Assignment #6
    Travis Deason / Jeff Lancon
    
    Loading JSON data via NY Times API URL and displaying results

  Sources:
  https://www.youtube.com/watch?v=fUkF-YLLXeg
  http://api.nytimes.com/svc/search/v2/articlesearch.json?q=processing&sort=newest&api-key='YourKeyCode'
  Note: The API query only returns the 10 most recent stories
*/

String [] headline = new String[10];
String scrollTxt;
float y =0;


void setup() {
  /* The URL for the JSON data   
  http://api.nytimes.com/svc/search/v2/articlesearch.json?q=processing&sort=newest&api-key='YourKey'
  Note: The API query only returns the 10 most recent stories
  */
  String apiKey = "Your_API_Key"; //https://developer.nytimes.com/
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
  /*  We decided to save the API results to a .txt file and read
      the headlines from the file, just in case the live API call
      did not work properly for some reason.
      To avoid this step, just comment out the loadStrings line and 
      change scrollTxt = join(healine, '\n');
  */

  //Loading headline data array from file and joining them together  
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
  float w = width*0.65;
  text(scrollTxt,-w/2,y,w,height*12);
  
  y-=1.2;  // Scroll speed adjust
}
