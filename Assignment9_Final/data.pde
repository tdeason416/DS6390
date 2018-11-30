class Data{
//Variables
  Table tableData;
  int dataField;
  int keeper;
  int xpos;
  int ypos;
  int sizew;
  int sizeh;
  String plotTitle;
  GeoMap geoMap;

//Constructors
    Data(){
    }
    Data(Table tableData, GeoMap geoMap, int xpos, int ypos, int sizew, int sizeh){
        this.xpos = xpos;
        this.ypos  = ypos;
        this.sizew = sizew;
        this.sizeh = sizeh;
        this.geoMap = geoMap;
        this.geoMap.readFile("world");
        this.tableData = tableData;
    }
}
