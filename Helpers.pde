int BigRound(int a,int factor){
 // a: the value to round
 // factor:  the SI value to round to.
  boolean isNegative=false;
  if(a<0){isNegative=true;}
  float b=abs(a/factor);
  b=ceil(b);
  b*=factor;
  if(isNegative==true){b*=-1;}
  return int(b);
}

void CalcPan(){
  float dx=target[0]-pan[0];
    float dy=target[1]-pan[1]; 
    pan[0]+=dx*pan_speed;
    pan[1]+=dy*pan_speed;
    translate((width/2)+pan[0],(height/2)+pan[1]);
}

boolean loadData(String tFileName){
   if(debugMode){println("\tloadData() ***STUB***");}
  return true;
}

boolean saveData(String tFileName){
  String[] outData= new String[islands.size()+1];
  outData[0]=island_seed+"\t"+int(pan[0])+"\t"+int(pan[1])+"\t"+scale+"\t"+current_island;
  if(debugMode){println("\tsaveData()\n\t\t\t\t<--- "+outData[0]);}
  for(int i=0; i < islands.size();i++){
      if(debugMode){print("\t");}
      Island island = islands.get(i);
      outData[i+1]=island.exportData();
  }
  return true;  
}
