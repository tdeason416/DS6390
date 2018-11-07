//********************************************
// MSDS 6390 - Data Visualization 
// Assignment 8 
// Names:  Travis Deason and Jeff Lancon
//********************************************

// Needed libraries
import org.gicentre.geomap.*;
import org.gicentre.utils.colour.*;   // Colors needed by GeoMap

Table tableData;
PImage header, bg;
color[] btncolors = new color[4];
String labels[][] = {{"Life Exp.", "Pop. Density", "GDP per Capita", "Mortality Rate"}, {"Bar1", "Bar2", "Bar3"}}; 

int numMenu = 2;
int[] menuBtnSize_x = {140,100};
int[] menuBtnSize_y = {30,25};
int[] menuLoc_x = {300,250};
int[] menuLoc_y = {550,600};

//Class Declarations
GeoMap geoMap; 
Menu[] optionMenu = new Menu[numMenu];

void setup(){
  size(1000, 1000);
  bg = loadImage("art-background.jpg");
  bg.resize(width,height);
  background(bg);
  header = loadImage("TheWorldBank.jpg");  //header graphic
  header.resize(65,55);
  
  tableData = loadTable("WorldBank_Data_2015.csv");  // Read data
  
  geoMap = new GeoMap(this);  // Create the geoMap object.
  btncolors[0] = color(#2B8BDE);  // background color
  btncolors[1] = color(35);  // label color
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected

  // Create optionMenu 
  for (int i = 0; i < numMenu; i++) {
    optionMenu[i] = new Menu(labels[i], menuBtnSize_y[i], menuBtnSize_x[i], btncolors,i);
  }
}



void draw(){
  
  background(bg);
  image(header,header.width/2,2);

  for (int i = 0; i < numMenu; i++) {
   // Display the Map menu - buttons in horizontal order
    optionMenu[i].build(menuLoc_x[i],menuLoc_y[i], true);
  // Selection of Map menu - buttons
    if (mouseX > menuLoc_x[i] && mouseX < (menuLoc_x[i]+labels[i].length*menuBtnSize_x[i])
          && mouseY > menuLoc_y[i] && mouseY< (menuLoc_y[i]+menuBtnSize_y[i]) && mousePressed && mouseButton == LEFT){
      optionMenu[i].selectedButton();
    }
    else {
    optionMenu[i].keepButton();
    }
  }
   
}
