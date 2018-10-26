class MarketValue {
 
  Table mvTable;
  float[] mv = new float[10];
  String[] country = new String[10];
  
  MarketValue(){
  }
  
  public void setMV(){
    
    this.mvTable = loadTable("FIFA18_MVteam.csv", "header");
    
    for (int row=0; row < mvTable.getRowCount(); row++){
      String c = mvTable.getString(row, "Country");
      float euro = mvTable.getFloat(row, "MarketValue");
      mv[row] = euro;
      country[row] = c;
    }
  }
  
  public float[] getMV(){
    return mv;
  }
  
  public String[] getCountry(){
    return country;
  }
  
  void mvDraw(String[] c2, float[] b2){

    //Display the Market Value Bar Chart
    barChart.setData(b2);
    barChart.setBarLabels(c2);
    barChart.setBarColour(color(213,43,30,200));
    barChart.setBarGap(10); 
    barChart.setValueFormat("€###");
    barChart.showValueAxis(true); 
    barChart.showCategoryAxis(true); 
    
    barChart.draw(10,height/1.9,width-20,height/2.2);
    fill(0);
    //textFont(titleFont);
    text("Market Value of World Cup 2018 Teams (in Millions of Euros)", width/2.6,height/1.9);
    text("Top 10 - in Millions of Euros", width/2.1, height/1.8);
    float textHeight = textAscent();

  }  
}
