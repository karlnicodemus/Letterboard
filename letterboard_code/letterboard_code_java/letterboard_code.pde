PImage board;

void setup() {
  size(1050,400);
  board = loadImage("letterboard.png");
}

void draw() {
  background(255);
  image(board,0,0,500,300);
  image(board,550,0,500,300);
  
  Table dataTable = loadTable("sampledata.csv", "header");
  
  noStroke();
  for(int i = 0; i < dataTable.getRowCount(); i++) {
    TableRow row = dataTable.getRow(i);
    fill(color(255,0,0,50));
    ellipse(row.getInt("x"),row.getInt("y"),10,10);
    fill(color(0,0,255,50));
    ellipse(row.getInt("x2"),row.getInt("y2"),10,10);
  }
}