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
  return true;
}

boolean saveData(String tFileName){
  String[] outData= new String[islands.size()+1];
  outData[0]=island_seed+"\t"+pan[0]+"\t"+pan[1]+"\t"+scale+"\t"+current_island;
  for(int i=0; i < islands.size();i++){
      Island island = islands.get(i+1);
      outData[i+1]=island.exportData();
  }
  return true;  
}
