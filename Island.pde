public static final int TYPE_UNKNOWN=-1;
public static final int TYPE_HOME=0;
public static final int TYPE_ISLAND=1;
public static final int TYPE_FORT=98;
public static final int TYPE_UFO=99;
public static final int TYPE_BOUY=100;

public static final byte FEATURE_YUCCA=          -128;
public static final byte FEATURE_POTATO=         -127;
public static final byte FEATURE_LAND_TREASURE=  -126;
public static final byte FEATURE_SHIP=           -125;

class Island {
   int[] destinations={0};      //Degrees to an island/object
   int[] distance={0};          //Distance from island 1..5
   int[] xy={300,50};
                               //  1: Very close, beach visible
                               //  2: Somewhat close
                               //  3: A distance away
                               //  4: Far away (outline barely visible)
                               //  5: Very far away (just a speck on the screen) 
   float   island_size;          
   String name;   
   boolean hasYucca=false;      //Has harvestable yucca plants on the island
   boolean hasPotato=false;     //Has harvestable potatoe plants on the island
   boolean hasTrees=true;       //Has uncut trees on the island
   boolean hasWreckages=true;   //Has unlooted wreckages on/near the island
   boolean explored=false;      //Has been explored.
                                //If false(default), hasYucca and hasPotato will
                                //Show "?" since their existence cannot be confirmed
   int      type=-1;            //Type of island/object.
                                //  -1:Unspecified/Unknown
                                //  0:"Home" island
                                //  1:Regular island
                                //  98:Water Fort
                                //  99: UFO
                                //  100:Bouy
   // Application statuses:
   boolean isFocused=false;     // Has user clicked on object
   boolean isHovered=false;     // Is user's mouse over object
   boolean isDragging=false;    // Is the users mouse dragging object.
   color islandColor=color(0);
                                
  
  Island(int type,int origin,int dist){
    destinations[0]=origin%360;  
    if(dist>5){dist=5;}
    if(dist<0){dist=0;}
    distance[0]=dist;
    island_size=home_size*sub_island_scale;
    name="Unnamed";
    println("Island created.\n\torigin given: "+origin+" (normalized: "+destinations[0]+")\n\tdistance given:"+dist+" (normalized: "+distance[0]+")");
    stats();
  }
  
  Island(int my_type){
    if(my_type!=0){my_type=-1;}
    island_size=home_size;
    name="Home";
    type=my_type;
  }
  
  boolean isMouseOver(){
    if(
    ((width/2)+pan[0]-mouseX) >= (-xy[0]-scale*(island_size/2)) 
    &&
    ((width/2)+pan[0]-mouseX)<=(-xy[0]+scale*(island_size/2))
    &&
    ((height/2)+pan[1]-mouseY) >= (-xy[1]-scale*(island_size/2)) 
    &&
    ((height/2)+pan[1]-mouseY)<=(-xy[1]+scale*(island_size/2))
    ){
      return true;
    }
    else{    
      return false;
    }
  }
  
  void selected(boolean status){
    if(status){
      isFocused=true;
      islandColor=island_focused;
    }
    else{
      isFocused=false;
      islandColor=island_normal;
    }
  }
  
  void hovered(boolean status){
    if(status&&!isFocused){
      islandColor=island_hover;
      isHovered=true;
    }
    else{
      islandColor=island_normal;
      isHovered=false;
    }
  }
  
  void addNeighbor(int direction){}
  
  void delNeightbor(int direction){}
  
  int[] getCartesian(){
    updateCoords();
    return xy;
  }
  
  void updateCoords(){}
  
  void display(){
     fill(islandColor);
     ellipse(xy[0],xy[1],scale*island_size,scale*island_size);
     fill(text_label);
     text(name, xy[0]+(scale*island_size)/2,xy[1]+(scale*island_size)/2);
     if(debugMode){
        int line_num=1;
        text("xy[]: {"+xy[0]+","+xy[1]+"}", (xy[0]+(scale*island_size)/2)+15,xy[1]+((scale*island_size)/2)+(line_num++*15));
        text("island_size: "+island_size, (xy[0]+(scale*island_size)/2)+15,xy[1]+((scale*island_size)/2)+(line_num++*15));
        text("type: "+type, (xy[0]+(scale*island_size)/2)+15,xy[1]+((scale*island_size)/2)+(line_num++*15));
        if(isFocused){
          text("Focused", (xy[0]+(scale*island_size)/2)+15,xy[1]+((scale*island_size)/2)+(line_num++*15));
        }
        if(isHovered){
          text("Hovered", (xy[0]+(scale*island_size)/2)+15,xy[1]+((scale*island_size)/2)+(line_num++*15));
        }
        
     }
  }
  
  void stats(){
    print("Island info:\n\tType: ("+type);
    switch(type){
      case TYPE_HOME:
        print(") Home Island");
        break;
      case TYPE_ISLAND:
        print(") Regular Island");
        break;
      case TYPE_FORT:
        print(") Sea Fort");
        break;
      case TYPE_UFO:
        print(") UFO (underwater)");
        break;
      case TYPE_BOUY:
        print(") Bouy");
        break;
      case TYPE_UNKNOWN:
      default:
        print(") UNKNOWN");
        break;
    }
    print("\n\t"+destinations.length+"\tneighboring islands\n\t");
    if(explored){
      print("has been explored\n\t");
      if(hasYucca){print("has harvestable Yucca plants\n\t");}
        else{print("does NOT have harvestable Yucca plants\n\t");}
      if(hasPotato){print("has harvestable Potato plants\n\t");}
        else{print("does NOT have harvestable Potato plants\n\t");}
    }
      else{print("has NOT been explored\n\t");}
    if(hasTrees){print("palms have NOT been deforested\n\t");}
      else{print("palms have been deforested\n\t");}
    if(hasWreckages){print("has wreckages to loot\n\t");}
      else{print("does NOT have wreckages to loot\n\t");}
    
    
    
  }
  
}
