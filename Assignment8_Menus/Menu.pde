// Menu for selection use button class; Horizontal / Vertical
 
class Menu {
  float posx, posy;
  String plotTitle;
  String[] ctrlabels;
  color[] ctrcolors;
  float ctrh, ctrw;
  Button[] controls;
  int menu;
  int keeper=0;
 
  Menu(){
  }
  
  Menu(String[] ctrlabels, color[] ctrcolors){
   this.ctrlabels = ctrlabels;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
  }
  
  Menu(String[] ctrlabels, float ctrh, float ctrw, color[] ctrcolors, int menu){
   this.ctrlabels = ctrlabels;
   this.ctrh = ctrh;
   this.ctrw = ctrw;
   this.ctrcolors = ctrcolors;
   this.menu = menu;
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
    for (int i=0; i<controls.length; i++) {
      if (this.ctrlabels[i] == optionSelected){keeper = i;}
    }
  } 


// selectedButton
  
  // Keep the selection of the button
  void keepButton(){   
    // keep selected button 
    controls[keeper].backcol = btncolors[3];
    controls[keeper].display();
          // First button options
          if (keeper == 0){
            if (menu == 0){
              plotTitle = "Life Expectancy at Birth (years) - 2015";
              wcMap(20, 60, tableData, 950, 475, 12, plotTitle, keeper);}
            else
              {plotTitle = "Life ????? (years) - 2015";
              wcMap(20, 670, tableData, 950, 475, 12, plotTitle, keeper);}
            }
         // Second button options         
          else if (keeper == 1){
            if (menu == 0){
              plotTitle = "Population Density (per sq km) - 2015";
              wcMap(20, 60, tableData, 950, 475, 5, plotTitle, keeper);}
            else
              {plotTitle = "Population ?????? (per sq km) - 2015";
              wcMap(20, 670, tableData, 950, 475, 5, plotTitle, keeper);}
          }
         // Third button options           
          else if (keeper == 2){
            if (menu == 0){
              plotTitle = "GDP Per Capita (USD$) - 2015";
              wcMap(20, 60, tableData, 950, 475, 51, plotTitle, keeper);}
            else
              {plotTitle = "GDP Per ??????? (USD$) - 2015";
              wcMap(20, 670, tableData, 950, 475, 51, plotTitle, keeper);}
            }
         // Fourth button options           
          else if (keeper == 3){
            if (menu == 0){
              plotTitle = "Mortality Rate, under 5 (per 1000 live births) - 2015";
              wcMap(20, 60, tableData, 950, 475, 17, plotTitle, keeper);}
            else
              {plotTitle = "Mortality ????? (per 1000 live births) - 2015";
              wcMap(20, 670, tableData, 950, 475, 17, plotTitle, keeper);}}
          else {keeper = 0; fill(0);};
      
      
    //switch(keeper) {      
    //    case (0):  // Life Expectancy Map
    //        keeper = 0;
    //        plotTitle = "Life Expectancy at Birth (years) - 2015";
    //        wcMap(20, 60, tableData, 950, 475, 12, plotTitle, keeper); 
    //        break;

    //      case (1):  // Population Density Map
    //        keeper = 1;
    //        plotTitle = "Population Density (per sq km) - 2015";
    //        wcMap(20, 60, tableData, 950, 475, 5, plotTitle, keeper);
    //        break;
          
    //      case (2):  // GDP per capita Map
    //        keeper = 2;
    //        plotTitle = "GDP Per Capita (USD$) - 2015";
    //        wcMap(20, 60, tableData, 950, 475, 51, plotTitle, keeper);
    //        break;
          
    //      case (3):  // Infant Mortality Rate Map
    //        keeper = 3;            
    //        plotTitle = "Mortality Rate, under 5 (per 1000 live births) - 2015";
    //        wcMap(20, 60, tableData, 950, 475, 17, plotTitle, keeper);
    //        break;
          
    //      default:
    //        keeper = 0;
    //        fill(0);
    //}        
  }
}
