class Bubble {
  float x, y;
  int diameter;
  String name;
  color circleColor;
  boolean over = false;
  
  Bubble(){
  }

  Bubble(int diameter, String name) {
    this.diameter = diameter;
    this.name = name;    
  }
 
  Bubble(int diameter, String name, color circleColor) {
    this.diameter = diameter;
    this.name = name;
    this.circleColor = circleColor;
  }
  
  // Display the Bubble
  void display(int xpos, int ypos, color circleColor) {
    stroke(0);
    strokeWeight(2);
    noFill();
    x = xpos;
    y = ypos;
    
    fill(color(circleColor));
    noStroke();
    ellipse(x, y, diameter, diameter);
    if (diameter > 10) {
      fill(0);
      textAlign(CENTER, CENTER);
      text(diameter,x,y);
      text(name,x,y+55);
    }
  }
}
