class Button { 
  float w, h, xpos, ypos;
  String text;
  int colr;
  
  Button (float new_w, float new_h, float new_xpos, float new_ypos, int new_colr, String new_text) {  
    ypos = new_ypos; 
    xpos = new_xpos;
    w = new_w;
    h = new_h;
    colr = new_colr;
    text = new_text;
  }
  
  void print_button() {
    fill(colr);
    rect(xpos, ypos, w, h);
    
    fill(#000000);
    textAlign(CENTER, CENTER);
    
  }
  
  boolean mouse_in_button() {
    if (mouseX >= xpos && mouseX <= xpos + w && mouseY >= ypos && mouseY <= ypos + h) {
      return true;
    } else {
      return false;
    }
  }
}