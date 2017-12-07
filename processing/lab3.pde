import java.util.*;

boolean showDonut = false;
Button b;

String[] name;
float []value;

void setup() {
  size(500,500);
  
  String[] lines = loadStrings("processing/datalab3.csv");
  name = new String[lines.length - 1];
  value = new float[lines.length - 1];
  for(int i = 1; i < lines.length; i++){
    String[] data = split(lines[i], ",");
    name[i - 1] = data[0];
    value[i - 1] = int(data[1]);
  }

 
}

void draw() {
  background(#D3D3D3);
  PieChart chart = new PieChart (name, value, width/4, height/4, width, height);
  chart.render();
}

void mouseClicked() {
  if (b.mouse_in_button()) {
    if (showDonut) {
      showDonut = false;
    } else {
      showDonut = true;
    }
  }
}