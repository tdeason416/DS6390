//Draw Tree Map
void drawGameTreeMap(){
  
  pTreeMappa = new PTreeMappa(this);  // Create an empty treemap.    
  pTreeMappa.readData("play.csv");    // Load the data and build the treemap. 
  TreeMapPanel tmPanel = pTreeMappa.getTreeMapPanel();
  tmPanel.setMutation(0.4);
  tmPanel.setLeafMaxTextSize(18);
  tmPanel.showStatistics();
  tmPanel.updateImage();
  tmPanel.updateLayout();
  pTreeMappa.createImage();
  tmPanel.writeImage("gameTMap.png");  

}
