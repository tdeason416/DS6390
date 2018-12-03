// Button is used in the menu
class Button{
  PVector pos;
  color backcol, labelcolor, mousecolor, selcolor;
  color[] controlColors;
  float bh, bw;
  String label;
  Boolean selected=false;

  Button() {
  }
  
  Button(String label, PVector pos, float bh, float bw, color[] controlColors) {
    this.pos = pos;
    this.label = label;
    this.bh = bh;
    this.bw = bw;
    this.controlColors = controlColors;
    this.backcol = controlColors[0];
    this.labelcolor = controlColors[1];
    this.mousecolor = controlColors[2];
    this.selcolor = controlColors[3];
  }
  
  // display the button  
  void display() {
    fill(color(this.backcol));
    
    stroke(110);
    strokeWeight(2);
    rect(this.pos.x, this.pos.y, this.bw, this.bh, 10); //round border
    textSize(15);
    fill(color(this.labelcolor));
    float wlabel= textWidth(this.label);
    textAlign(LEFT,CENTER);
    text(this.label, this.pos.x+(this.bw-wlabel)/2, this.pos.y+13);       
  }

  // function to determine if the button is selected
  boolean isSelected() {
    if (mouseX > this.pos.x && mouseX < this.pos.x + bw && mouseY > this.pos.y && mouseY < this.pos.y + bh ) 
      return true;
    else{
       return false;
       }
  }

}
