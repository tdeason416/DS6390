// Menu for selection use button class; Horizontal / Vertical
 
class Menu {
  float posx, posy;
  String plotTitle;
  String[] ctrlabels;
  color[] ctrcolors;
  float ctrh, ctrw;
  Button[] controls;
  HashMap<String, String> buttonToName;
  float dataMax;
  float dataMin;
  float minColor;
  float maxColor;
  Data data;
  ColourTable myCTable;
  int keeper;
  Map displayMap;
 
  Menu(){
  }
  
  Menu(String[] ctrlabels, color[] ctrcolors){
   this.ctrlabels = ctrlabels;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
  }
  
  Menu(String[] ctrlabels, float ctrh, float ctrw, color[] ctrcolors, Data data, HashMap<String, String> buttonToName){
   this.ctrlabels = ctrlabels;
   this.ctrh = ctrh;
   this.ctrw = ctrw;
   this.data = data;
   this.ctrcolors = ctrcolors;
   controls = new Button[ctrlabels.length];
   this.buttonToName = buttonToName;
   this.setColorScale(this.keeper);
   this.setColorTable();
   this.keeper = 1;
   this.displayMap = new Map(data, buttonToName.get("Life Exp."), this.myCTable);
   this.displayMap.drawCountries();
   this.displayMap.drawTitleText();
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
  
      void setColorScale(int keeper){
        this.dataMax = 0;
        this.dataMin = 0;
        for(TableRow row : this.data.tableData.rows()){
            this.dataMax = max(this.dataMax, row.getFloat(this.data.dataField));
            this.dataMin = min(this.dataMin, row.getFloat(this.data.dataField));
        }
    }

    void setColorTable(){
        if(this.keeper == 1){
        this.myCTable = ColourTable.getPresetColourTable(ColourTable.SPECTRAL,dataMin,dataMax);
        }
        else if(this.keeper == 2){
        this.myCTable = ColourTable.getPresetColourTable(ColourTable.RD_YL_GN,dataMin,dataMax);
        }
        else if(this.keeper == 3){
        this.myCTable = ColourTable.getPresetColourTable(ColourTable.RD_YL_GN,dataMin,dataMax);
        }
        else{
            this.myCTable = ColourTable.getPresetColourTable(ColourTable.REDS,dataMin,dataMax);
        }
    }

    void saveColorTable(){
        ColourTable.writeFile(myCTable,createOutput("mapColors.ctb"));
  }
  
  // Function used to identified the selected button
  void selectedButton() {
    String optionSelected="";
    for (int i=0; i < controls.length; i++) {
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
            this.keeper = 1;
            break;
          case ("Pop. Density"):
            this.keeper = 2;
            break;
          case ("GDP per Capita"):
            this.keeper = 3;
            break;
          case ("Mortality Rate"):
            keeper = 4;
            break;
          default:
            keeper = 1;
            fill(0);
    }
    displayMap =  new Map(data, this.buttonToName.get(optionSelected), this.myCTable);
    displayMap.drawCountries();
    displayMap.drawTitleText();
  } // selectedButton
  
  // Keep the selection of the button
  void keepButton(){   
    displayMap.drawCountries();
    displayMap.drawTitleText();
    // keep selected button 
    controls[keeper-1].backcol = btncolors[3];
    controls[keeper-1].display();
    displayMap.displayCountryData();
    // switch(keeper) {
    //       case (1):  // Life Expectancy Map
    //         keeper = 1;

    //         plotTitle = "Life Expectancy at Birth (years) - 2015";
    //         wcMap(20, 60, tableData, 950, 475, 12, plotTitle, keeper); 
    //         break;

    //       case (2):  // Population Density Map
    //         keeper = 2;
    //         plotTitle = "Population Density (per sq km) - 2015";
    //         wcMap(20, 60, tableData, 950, 475, 5, plotTitle, keeper);
    //         break;
          
    //       case (3):  // GDP per capita Map
    //         keeper = 3;
    //         plotTitle = "GDP Per Capita (USD$) - 2015";
    //         wcMap(20, 60, tableData, 950, 475, 51, plotTitle, keeper);
    //         break;
          
    //       case (4):  // Infant Mortality Rate Map
    //         keeper = 4;            
    //         plotTitle = "Mortality Rate, under 5 (per 1000 live births) - 2015";
    //         wcMap(20, 60, tableData, 950, 475, 17, plotTitle, keeper);
    //         break;
          
    //       default:
    //         keeper = 1;
    //         fill(0);
    // }        
  }
}
