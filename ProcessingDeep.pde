/*
    Processing Deep
      The Stranded Deep self mapping tool
      CC-BY Brendan Orr <brendan@brendanorr.com>
*/

public static int[] VERSION={0,1,0};  // Major.Minor.Release

//import toxi.math.conversion.*;
import toxi.geom.*;
//import toxi.math.*;
//import toxi.geom.mesh2d.*;
//import toxi.util.datatypes.*;
//import toxi.util.events.*;
//import toxi.geom.mesh.subdiv.*;
//import toxi.geom.mesh.*;
//import toxi.math.waves.*;
//import toxi.util.*;
//import toxi.math.noise.*;


PFont font;

///// Static variables //////
float sub_island_scale=0.50;  // Scale offset from the home island.
float home_size=30;
float pan_speed=0.05;
int  grid_spacing=100; 

boolean debugMode=true;


///// Runtime variables /////
float[]pan    ={0.0,0.0};
float[]target ={0.0,0.0};
float scale=1.0;              // Zoom of the island.
int current_island=0;
int island_seed=0;

ArrayList<Island> islands;

void setup(){
   size(1000 ,1000); 
   islands = new ArrayList<Island>();
   islands.add(new Island(TYPE_HOME));
   
   font=createFont("DejaVuSansMono-12.vlw",12);
   textFont(font);
   textAlign(CENTER);
   
}

void draw(){
    background(water);
    fill(255);
    stroke(255,255,255,0);
    
    CalcPan();      // Move the viewport(smoothly)
    render_grid();  // Render the grid
    
    //Render the islands
    for(int i=0;i < islands.size();i++){
      Island island = islands.get(i); 
      island.display();
      if(island.isMouseOver()){
          island.hovered(true);
      }
      else{
          island.hovered(false);
      }
    }
    
   if(debugMode){render_debugOverlay();}  //Render any debugging text.
}

void mousePressed(){
     //TODO: Check to see if mouse click is on an island    
    switch(mouseButton){
      case LEFT:
       int X=(mouseX-(width/2));
       int Y=(mouseY-(height/2));
       boolean isOverIsland=false;
       for(int i=0;i < islands.size();i++){
          Island island = islands.get(i); 
          if(island.isMouseOver()){
              island.selected(true);
              isOverIsland=true;
              target=float(island.getCartesian());
              target[0]*=-1;
              target[1]*=-1;
          }
          else{
              if(isOverIsland){
                island.selected(false);
              }
          }
          if(!isOverIsland){
            target[0]=pan[0]-X;
            target[1]=pan[1]-Y;
          }
        }
       break;
      case CENTER:
       scale=1.0;
       break;
      case RIGHT:
        for(int i=0;i < islands.size();i++){
          Island island = islands.get(i); 
          island.selected(false);          
        }
       break; 
     
    } 
}

void keyPressed(){
   if(key==CODED){
     switch(keyCode){
        case 36:
          target[0]=0;
          target[1]=0;
          break;
        case UP:
          target[1]+=50*scale;
          break;
        case DOWN:
          target[1]-=50*scale;
          break;
        case LEFT:
          target[0]-=50*scale;
          break;
        case RIGHT:
          target[0]+=50*scale;
          break;
     }
  }
}

void mouseWheel(MouseEvent event){
   int evt=event.getCount();
   switch(evt){
     case -1:
       scale+=0.1;
       break;
     case 1:
       scale-=0.1;
       break; 
   }
  
};

















