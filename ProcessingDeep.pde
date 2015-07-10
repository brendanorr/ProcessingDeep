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

///// Static variables //////
float sub_island_scale=0.50;  // Scale offset from the home island.
float home_size=30;
float pan_speed=1.01;


///// Runtime variables /////
int[]pan    ={0,0};
int[]target ={0,0};
float scale=1.0;              // Zoom of the island.
int current_island=0;
int island_seed=0;

ArrayList<Island> islands;

void setup(){
   size(600,600); 
   islands = new ArrayList<Island>();
   islands.add(new Island(TYPE_HOME));
   
}

void draw(){
    background(40,40,255);
    pan[0]=int(((pan[0]*2)+target[0])/3);
    pan[1]=int(((pan[1]*2)+target[1])/3);
    translate((width/2)+pan[0],(height/2)+pan[1]);
    fill(30,255,30);
    //println("running...");
    for(int i=0;i < islands.size();i++){
      Island island = islands.get(i); 
      island.display();
      //island.stats();
    }
}

void mousePressed(){
     //TODO: Check to see if mouse click is on an island 
     target[0]=(width/2)-mouseX;
     target[1]=(height/2)-mouseY;
     println("mousePressed():\n\tpan[0]="+pan[0]+", pan[1]="+pan[1]+"\n\ttarget[0]="+target[0]+",target[1]="+target[1]);
     println("\twindow:  width="+width+"\theight="+height);
}
