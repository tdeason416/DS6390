/* https://www.youtube.com/watch?v=fUkF-YLLXeg

*/
String scrollTxt;
float y =0;

void setup() {
//  size(1200,600, P3D);
  fullScreen(P3D);
  String[] lines = loadStrings("meetups.txt");
  scrollTxt = join(lines,'\n');
  y = height/2;
  PFont myFont = createFont("NEW GOTHIC MT", 22);
  textFont(myFont);
}

void draw() {
  background(0);
  translate(width/2,height/2);
  fill(238,213,75);
  textSize(width*0.04);
  textAlign(CENTER);
  rotateX(PI/4);
  float w = width*0.7;
  text(scrollTxt,-w/2,y,w,height*12);
  y-=1.3;
}
