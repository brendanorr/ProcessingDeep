public static final int TYPE_UNKNOWN=-1;        //Undefined and unattached to any nearby islands
public static final int TYPE_HOME=0;            
public static final int TYPE_ISLAND=1;
public static final int TYPE_FORT=98;
public static final int TYPE_UFO=99;
public static final int TYPE_BOUY=100;

public static final byte FEATURE_YUCCA=          1;
public static final byte FEATURE_POTATO=         2;
public static final byte FEATURE_LAND_TREASURE=  4;
public static final byte FEATURE_SHIP=           8;

class Island {
   //Island descriptors:
   int[] destinations={0};      //Degrees to an island/object
   int[] xy={0,0};
   float   island_size;          
   String name;   
   byte  features;
   boolean explored=false;      //Has been explored.
   int      type=TYPE_UNKNOWN;           
   // Runtime statues:
   boolean isFocused=false;     // Has user clicked on object
   boolean isHovered=false;     // Is user's mouse over object
   boolean isDragging=false;    // Is the users mouse dragging object.
   color islandColor=color(0);
   int[] temp_xy={0,0};         // current XY coordinates of the island (allows for smooth sliding of island)
                                
  //Normal island constructor:
  Island(int type,int origin,int dist){
    destinations[0]=origin%360;
    island_size=home_size*sub_island_scale;
    name="Unnamed";
    if(debugMode){println("\tIsland( int type="+type+", int origin="+origin+", int dist="+dist+")");}
  }
  
  //Home or placeholder island constructor:
  Island(int my_type){
    if(debugMode){print("\tIsland( int my_type="+my_type+"(");}
    if(my_type!=0){my_type=-1;}
    island_size=home_size;
    name="Home";
    type=my_type;
    if(debugMode){println(my_type+")\tisland_size="+island_size+", name="+name);}
  }

  //Detects if mouse is over the item:
  boolean isMouseOver(int cursor_x, int cursor_y){
    if(
    ((width/2)+pan[0]-cursor_x) >= (-xy[0]-scale*(island_size/2)) 
    &&
    ((width/2)+pan[0]-cursor_x)<=(-xy[0]+scale*(island_size/2))
    &&
    ((height/2)+pan[1]-cursor_y) >= (-xy[1]-scale*(island_size/2)) 
    &&
    ((height/2)+pan[1]-cursor_y)<=(-xy[1]+scale*(island_size/2))
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
  
  void addNeighbor(int direction){} //STUB
  
  void delNeightbor(int direction){} //STUB
  
  int[] getCartesian(){
    if(debugMode){print("\tgetCartesian()\n\t");}
    updateCoords();
    if(debugMode){println("\t<---["+xy[0]+","+xy[1]+"]");}
    return xy;
  }
  
  // Updates the Coordinates of the island by calculating its intersections from surrounding islands
  void updateCoords(){
    if(debugMode){println("\tupdateCoords() ***STUB***");}
  }
  
  void display(){
     if(isFocused){islandColor=island_focused;}
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
  
  String exportData(){
    //Export format: [dataType]
    // name[string]  type[int]  island_size[float]  features[int]  explored[0,1]  x[int]  y[int]  destination1[int],destination2[int],destinationN[int]
    String outData = name+"\t"+type+"\t"+island_size+"\t"+features+"\t"+int(explored)+"\t"+xy[0]+"\t"+xy[1]+"\t";
    for(int i=0;i < destinations.length; i++){
      outData=outData+destinations[i];
      if(destinations.length>1){outData=outData+",";}
    }
    if(debugMode){println("\texportData()\t<--- "+outData);}
    return outData;
  }

  // Imports a string into the member values.
  void importData(){
    if(debugMode){println("\timportData() ***STUB***");}
  } 


}
