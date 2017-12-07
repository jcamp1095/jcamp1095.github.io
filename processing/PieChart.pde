class PieChart {
   String[] names;
   float[] values;
   float totalSum;
   float lastRadian;
   color defaultColor;
   color newColor;
   List<Arc> arcs;
   boolean show_text;
   String text_name;
   float circleDiameter;
   int wid;
   int hgt;
   int xpos;
   int ypos;
  
   PieChart(String[] name, float[] value, int x, int y, int w, int h){
     defaultColor = color(255, 255, 255);
     newColor = color(25, 112, 199);
     totalSum = 0;
     names = name;
     values = value; //<>//
     wid = w;
     hgt = h;
     xpos = x;
     ypos = y;
     
     for (int i = 0; i < values.length; i++) {
        totalSum += values[i];
     } //<>//
     
     lastRadian = 0;
     
     show_text = false;
     text_name = "";
     circleDiameter = min(.5*wid, .5*hgt);
     arcs = new ArrayList<Arc>();
     //<>//
     b = new Button(wid/6, hgt/7, 0, 0, #ffffff, "toggle");
     b.print_button();
     
   }
   
   void render() {
     
     for (int i = 0; i < values.length; i++) {
        Arc arc = new Arc(xpos + circleDiameter/2, ypos + circleDiameter/2, circleDiameter, values[i], names[i], defaultColor);
        float radians = arc.drawArc(totalSum, lastRadian);
        lastRadian = lastRadian + radians;
        arcs.add(arc);
      }
      
      float radians;
      for (int i = 0; i < arcs.size(); i++) {
        Arc a = arcs.get(i);
        if (a.mouseOnArc()) {
          a.setColor(newColor);
          radians = a.drawArc(totalSum, lastRadian);
          show_text = true;
          text_name = a.getName();
        } else {
          a.setColor(defaultColor);
          radians = a.drawArc(totalSum, lastRadian);
        }
        lastRadian = lastRadian + radians;
      }  
      float diameter = min(.2*wid, .2*hgt);
      if (showDonut) {
        fill(#D3D3D3);
        ellipse(wid/2, hgt/2, diameter, diameter);
      }
    
      if (show_text) {
        fill(0);
        text(text_name, mouseX, mouseY);
      }
   
   }
}
   
     