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
                               //  1: Very close, beach visible
                               //  2: Somewhat close
                               //  3: A distance away
                               //  4: Far away (outline barely visible)
                               //  5: Very far away (just a speck on the screen) 
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

                                
  
  Island(int type,int origin,int dist){
    destinations[0]=origin%360;  
    if(dist>5){dist=5;}
    if(dist<0){dist=0;}
    distance[0]=dist;
    println("Island created.\n\torigin given: "+origin+" (normalized: "+destinations[0]+")\n\tdistance given:"+dist+" (normalized: "+distance[0]+")");
    stats();
  }
  
  Island(int my_type){
    if(my_type!=0){my_type=-1;}
    
    type=my_type;
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
