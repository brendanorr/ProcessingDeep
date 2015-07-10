void render_grid(){
    // Vertical
    for(int i=0; i < ((width/grid_spacing)+1); i++){
      float line_x=-(width/2)+(grid_spacing*i)-(BigRound(int(pan[0]),grid_spacing))  ;
      line(line_x, -(height/2)-pan[1], line_x, (height/2)-pan[1]);
      textAlign(LEFT);
      text(int(line_x),line_x,(height/2)-pan[1]-13);   
    }
    // Horizontal
    for(int i=0; i < ((height/grid_spacing)+1); i++){
      float line_y=-(height/2)+(grid_spacing*i)-(BigRound(int(pan[1]),grid_spacing))  ;
      line( -(width/2)-pan[0],line_y, (width/2)-pan[0],line_y);
      textAlign(LEFT);
      text(int(line_y),-(width/2)-pan[0]+13,line_y-2);   
    }
}

void render_debugOverlay(){
  text("pan: ("+int(pan[0])+","+int(pan[1])+")",-(width/2)-pan[0]+20,-(height/2)-pan[1]+13);
  int X=int((mouseX-(width/2))-pan[0]);
  int Y=int((mouseY-(height/2))-pan[1]);
  textAlign(CENTER);
  text("("+X+","+Y+")", X , Y );
}
