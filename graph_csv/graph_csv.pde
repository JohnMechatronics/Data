int[] homeRuns;

void setup() {
  size(960, 240);
  Table stats = loadTable("ortiz.csv");
  int rowCount = stats.getRowCount();
  homeRuns = new int[rowCount];
  for (int i = 0; i < homeRuns.length; i++) {
    homeRuns[i] = stats.getInt(i, 1);
  }
}

void draw() {
  background(204);
  // Draw background grid for data
  stroke(255      );
  line(20, 200, 20, 20);
  line(20, 200, 920, 200);
  for (int i = 0; i < homeRuns.length; i++) {
    float x = map(i, 0, homeRuns.length-1, 20, 920);
    line(x, 20, x, 200);
  }
  // Draw lines based on home run data
  noFill();
  stroke(204, 51, 0);
  beginShape();
  for (int i = 0; i < homeRuns.length; i++) {
    float x = map(i, 0, homeRuns.length-1, 20, 920);
    float y = map(homeRuns[i], 0, 60, 200, 20);
    vertex(x, y);
  }
  endShape();
}