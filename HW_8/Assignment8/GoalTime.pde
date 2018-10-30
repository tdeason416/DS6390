//Adapted from Graphica Life Expectacny Example

void goalTime(){
    // Load the CSV dataset. 
  Table goalTable = loadTable("GoalDistribution.csv", "header");

  // Save the data in one GPointsArray and calculate the point sizes
  GPointsArray points = new GPointsArray();
  float[] pointSizes = new float[goalTable.getRowCount()];
  
  for (int row = 0; row < goalTable.getRowCount(); row++) {
    float time = goalTable.getFloat(row, "Time");
    float goals = goalTable.getFloat(row, "Goals");
    String goalsT = goalTable.getString(row, "Goals");
    float gSize = goalTable.getFloat(row, "Goals");
    points.add(time, goals, goalsT);
    pointSizes[row] = gSize*1.4;
  }

  // Create the plot
  plot = new GPlot(this, 10, height/2, width-20, height/2.2);
  plot.setDim(900, 400);
  plot.setTitleText("When Were Goals Scored?");
  plot.getXAxis().setAxisLabelText("Game Time (minutes)");
  plot.getYAxis().setAxisLabelText("Goals Scored");
  plot.setPoints(points);
  plot.setPointSizes(pointSizes);
  plot.activatePointLabels();
  plot.activatePanning(RIGHT);
  plot.activateZooming(1.1, CENTER, CENTER);
}

void drawGoalTime(){
  // Draw the plot  
  plot.beginDraw();
  plot.drawBox();
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawGridLines(GPlot.BOTH);
  plot.drawPoints();
  plot.drawLabels();
  plot.endDraw();
}
