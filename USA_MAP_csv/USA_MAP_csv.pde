//Reads a csv file of US cities and maps the city location to points on screan.

Table cities; // 

void setup() {
  size(1000, 600);
  cities = loadTable("cities.csv", "header"); 
  stroke(0,255,0);
}

void draw() {
  background(0, 0, 0);
  translate(-900, -750);
  scale(6);
  strokeWeight(0.3);
  for (int i = 0; i < cities.getRowCount(); i++) {
    float latitude = cities.getFloat(i, "lat");
    float longitude = cities.getFloat(i, "lng");
    setXY(latitude, longitude);
  }
}

void setXY(float lat, float lng) {
  float x = map(lng, -180, 180, 0, width);
  float y = map(lat, 90, -90, 0, height);
  point(x, y);
}