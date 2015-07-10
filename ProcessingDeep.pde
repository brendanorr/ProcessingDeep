import penner.easing.*;

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


///// Runtime variables /////
float[]pan    ={0.0,0.0};
float[]target ={0.0,0.0};
float scale=1.0;              // Zoom of the island.
int current_island=0;
int island_seed=0;

ArrayList<Island> islands;

void setup(){
   size(600,600); 
   islands = new ArrayList<Island>();
   islands.add(new Island(TYPE_HOME));
   
   font=createFont("DejaVuSansMono-12.vlw",12);
   textFont(font);
   textAlign(CENTER);
   
}

void draw(){
    background(40,40,255);
    fill(30,255,30);
    
    float dx=target[0]-pan[0];
    float dy=target[1]-pan[1]; 
    pan[0]+=dx*pan_speed;
    pan[1]+=dy*pan_speed;
    translate((width/2)+pan[0],(height/2)+pan[1]);
    
    
    //println("running...");
    
    ////Render the grid
    int num_x_grids=(width/grid_spacing)-1;
    for(int i=0; i < num_x_grids; i++){
      float line_x = (num_x_grids/2)-i; 
      line_x=(pan[0]+(line_x*grid_spacing));
      println("line_x="+line_x);
      
      line(line_x, pan[1]-(height/2), line_x, pan[1]-(height/2));
    }
    
    
    //Render the islands
    for(int i=0;i < islands.size();i++){
      Island island = islands.get(i); 
      island.display();
      //island.stats();
    }
    int X=int((mouseX-(width/2))-pan[0]);
    int Y=int((mouseY-(height/2))-pan[1]);
    text("("+X+","+Y+")", X , Y );
}

void mousePressed(){
     //TODO: Check to see if mouse click is on an island     
     int X=(mouseX-(width/2));
     int Y=(mouseY-(height/2));
     target[0]=pan[0]-X;
     target[1]=pan[1]-Y;
     println("mousePressed():\n\tpan[0]="+pan[0]+", pan[1]="+pan[1]+"\n\ttarget[0]="+target[0]+",target[1]="+target[1]);
     println("\twindow:  width="+width+"\theight="+height);
}

void mouseMoved(){
    //TODO Island highlighting and tooltips
  
  
}

void keyPressed(){
   if(key==CODED&&keyCode==36){
     target[0]=0;
     target[1]=0;
   }
  
}


















