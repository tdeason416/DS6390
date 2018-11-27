//class BarChart extends Data{
//    //Variables
//    Data data;
//    int gapWidth;
//    int rowWidth;

//    //Constructors
//    BarChart(){

//    }

//    BarChart(Data data, int gapWidth){
//        this.data = data;
//        this.gapWidth = gapWidth;
//        int nRows = this.data.tableData.getRowCount();
//        this.rowWidth = ((this.data.sizew - 8 * this.gapWidth) / nRows) - this.gapWidth;
//    }

//    //Standard Methods
//    void drawBar(int locX, float value, color clr, String countryName){
//        noStroke();
//        fill(clr);
//        beginShape();
//        int yPos = this.data.ypos + 100;
//        vertex(int(locX), yPos);
//        vertex(int(locX) + this.rowWidth, yPos);
//        vertex(int(locX) + this.rowWidth, yPos - int(value));
//        vertex(int(locX), yPos + value);
//        endShape();
//        textSize(this.rowWidth);
//        pushMatrix();
//        translate(int(locX), yPos);
//        rotate(PI/2);
//        text(countryName);
//        popMatrix();
//    }

//    void drawChart(){
//        //background
//        fill(#D7E4FA);
//        noStroke();
//        rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
//        // stroke(120);
//        // strokeWeight(0.5);
//        // Draw Country Data
//        this.currentPos = this.data.xpos + this.gapWidth * 4;
//        for(String countryName : this.data.tableData.getStringColumn("Country Name")){
//            TableRow dataRow = this.data.tableData.findRow(countryName, 1);
//            if(dataRow != null){
//                float value = dataRow.getFloat(this.data.dataField);
//                color clr = this.data.myCTable.findColour(value);
//                this.drawBar(locX, value, clr, countryName);
//        }
//        else{                   
//        // No data found in table.
//            fill(#D1D3D1);
//        }
//        }
//    }

//    // void displayAttr(){

//    // }
//}
