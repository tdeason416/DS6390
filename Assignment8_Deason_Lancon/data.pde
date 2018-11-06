class Data{
//Variables
  int xpos;
  int ypos;
  Table tableData;
  int sizew;
  int sizeh;
  int dataField;
  String plotTitle;
  float dataMax;
  float dataMin;
  float minColor;
  float maxColor;
  GeoMap geoMap;
  ColourTable myCTable;

//Constructors
    Data(){
    }

    Data(int xpos, int ypos, Table tableData, int sizew, int sizeh, 
        int dataField, String plotTitle, int keeper){
        this.geoMap = geoMap;
        this.plotTitle = plotTitle;
        this.sizew = sizew;
        this.sizeh = sizeh;
        this.xpos = xpos;
        this.ypos = ypos;
        this.geoMap = new GeoMap(xpos, ypos, Table tableData);
        this.geoMap.readFile("world");
        this.keeper = keeper;
        this.setColorScale();
        this.setColorTable();
        this.saveColorTable();
    }

    void setColorScale(){
        this.dataMax = 0;
        this.dataMin = 0;
        for(TableRow row : this.tableData.rows()){
            this.dataMax = max(this.dataMax, row.getFloat(this.dataField));
            this.dataMin = min(this.dataMin, row.getFloat(this.dataField));
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
            myCTable = ColourTable.getPresetColourTable(ColourTable.REDS,dataMin,dataMax);
        }
    }

    void saveColorTable(){
        ColourTable.writeFile(myCTable,createOutput("mapColors.ctb"));
  }

}