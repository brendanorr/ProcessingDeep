color water=color(40,40,255);
color text_debug=color(0,255,0);
color text_label=color(255);

color island_normal=color(30,128,30);
color island_hover=color(30,200,30);
color island_focused=color(90,255,90);

color grid_x  = color(255,255,255,64);
color grid_y  = color(255,255,255,64);


void render_grid(){
    // TODO:  render_grid() doesn't handle grid_spacing that isn't a factor of the width or height  
  
    // Vertical
    stroke(grid_x);
    for(int i=0; i < ((width/grid_spacing)+1); i++){
      float line_x=-((width)/2)+(grid_spacing*i)-(BigRound(int(pan[0]),grid_spacing))  ;
      line(line_x, -(height/2)-pan[1], line_x, (height/2)-pan[1]);
      textAlign(LEFT);
      text(int(line_x),line_x,(height/2)-pan[1]-13);   
    }
    stroke(grid_y);
    // Horizontal
    for(int i=0; i < ((height/grid_spacing)+1); i++){
      float line_y=-(height/2)+(grid_spacing*i)-(BigRound(int(pan[1]),grid_spacing))  ;
      line( -(width/2)-pan[0],line_y, (width/2)-pan[0],line_y);
      textAlign(LEFT);
      text(int(line_y),-(width/2)-pan[0]+13,line_y-2);   
    }
}

void render_debugOverlay(){
  int line_num=1;
  fill(text_debug);
  textAlign(LEFT);
  text("pan: ("+int(pan[0])+","+int(pan[1])+")",-(width/2)-pan[0]+20,-(height/2)-pan[1]+(13*line_num++));
  text("zoom: "+scale, -(width/2)-pan[0]+20,-(height/2)-pan[1]+(13*line_num++));
  int X=int((mouseX-(width/2))-pan[0]);
  int Y=int((mouseY-(height/2))-pan[1]);
  textAlign(CENTER);
  text("Adjusted: ("+X+","+Y+") mouse: ("+mouseX+","+mouseY+")", X , Y );
}


