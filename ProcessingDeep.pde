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


///// Runtime variables /////
int pan_x=0;            // X offset of islands
int pan_y=0;            // Y offset of islands
float scale=1.0;              // Zoom of the island.
int current_island=0;

Island[]   island= new Island[1];

void setup(){
   size(600,600); 
   island[1]=new Island(TYPE_HOME);
   
}

void draw(){
    background(40,40,255);
    translate((width/2)+pan_x,(height/2)+pan_y);
    fill(30,255,30);
    println("running...");
    for(int i=0;i < island.length;i++){
      island[i].stats();
    }
    delay(10000);
}


