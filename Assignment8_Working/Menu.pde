// Menu for selection use button class
// it can be display horizontal or vertical 
class Menu {
  float posx, posy;
  String plotTitle;
  String[] ctrlabels;
  color[] ctrcolors;
  float ctrh, ctrw;
  Button[] controls;
  int keeper=1;
 
  Menu(){
  }
  
  Menu(String[] ctrlabels, color[] ctrcolors){
   this.ctrlabels = ctrlabels;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
  }
  
  Menu(String[] ctrlabels, float ctrh, float ctrw, color[] ctrcolors){
   this.ctrlabels = ctrlabels;
   //this.ctrcolors = ctrcolors;
   this.ctrh = ctrh;
   this.ctrw = ctrw;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
  }
  
  // build function - display the menu in the defined x,y position and orientation (horizontal = true)
  void build(float posx, float posy, boolean horizontal){
    PVector ctrpos;
    this.posx = posx;
    this.posy = posy;
    
    for (int i=0; i<ctrlabels.length; i++) {
      ctrpos = new PVector(posx, posy);  
    
      controls[i] = new Button(this.ctrlabels[i],ctrpos, this.ctrh, this.ctrw, this.ctrcolors);
      controls[i].display();
      if (horizontal) {
        posx = posx+ctrw;
      }   
      else {
        posy = posy+ctrh;
      }
    }
  } // build
  
  // Function used to identified the selected button
  void selectedButton() {
    String optionSelected="";
    
    for (int i=0; i<controls.length; i++) {
      if (controls[i].isSelected() && mousePressed) {
        controls[i].backcol = btncolors[3];
        controls[i].selected = true;
        controls[i].display();
        optionSelected = controls[i].label;
      }
      else {
        controls[i].backcol = btncolors[0];
        controls[i].selected = false;
        controls[i].display();
      }
    }
    fill(255);
    switch(optionSelected) {
          case ("Life Exp."):   
            keeper = 1;
            break;
          case ("Pop. Density"):
            keeper = 2;
            break;
          case ("GDP per Capita"):
            keeper = 3;
            break;
          case ("Mortality Rate"):
            keeper = 4;
            break;
          default:
            keeper = 1;
            fill(0);
    }    
  } // selectedButton
  
  // Keep the selection of the button
  void keepButton(){   
    // keep selected button 
    controls[keeper-1].backcol = btncolors[3];
    controls[keeper-1].display();
    switch(keeper) {
          case (1):  // Life Expectancy Map
            plotTitle = "Life Expectancy at Birth (years) - 2015";
            wcMap(20, 60, tableData, 950, 475, 12, plotTitle); 
            //AgeGraph.loadData("SquadsGroupAge.csv");
            //AgeGraph.displayAll(70,610, color(#BB0104, 70), color(#2B8BDE));
            //table1 = loadTable("SquadsGroupAge.csv", "header");
            //buildTable.drawTable(20,760, table1, false);
            keeper = 1;
            break;
          case (2):  // Population Density Map
            //drawGoalTime();
            plotTitle = "Population Density (per sq km) - 2015";
            wcMap(20, 60, tableData, 950, 475, 5, plotTitle);
            keeper = 2;
            break;
          case (3):  // GDP per capita Map
            //marketValue.mvDraw(cName, barData);
            plotTitle = "GDP Per Capita (USD$) - 2015";
            wcMap(20, 60, tableData, 950, 475, 51, plotTitle);
            keeper = 3;
            break;
          case (4):  // Infant Mortality Rate Map
            plotTitle = "Mortality Rate, under 5 (per 1000 live births) - 2015";
            wcMap(20, 60, tableData, 950, 475, 17, plotTitle);
            //text("How is World Cup Game Time Allocated?", 400, 530);
            //gTreeMap = loadImage("gameTMap.png");
            //gTreeMap.resize(880, 440);
            //image(gTreeMap, 60, 540);
            keeper = 4;
            break;
          default:
            keeper = 1;
            fill(0);
    }        
  }
}
