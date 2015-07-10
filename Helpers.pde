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
