#ifndef (Arbre_Inc_Temp)
#declare Arbre_Inc_Temp = version;
#version 3.6;
       
#macro arbre(pos, rot, sca)         
#declare A1 =<0, 0, 6>;// points blob arbres 
#declare A2 =<-4,12,0>;
#declare A3 =<-2,10,0>;
#declare A4 =<-2,10,0>;
#declare A5 =<-2,14,3>;
#declare A6 =<-2,16,1>;
#declare A7 =<0,18,0>;
#declare A8 =<2,10,2>;


#declare C1 =<0,0,0>; //Points du tronc d'arbre
#declare C2 =<0,20,0>;
#declare r =2 ; 

#declare tree =
union {
    cylinder{
        C1 C2 r  
        texture{
            Dark_Wood
        }
    } 
  blob{
    threshold 0.5
    sphere{<0, 20, 6>, 4, 1}
    sphere{<4, 20, 4>, 4, 1}
    sphere{<6, 20, 0>, 4, 1}
    sphere{<4, 20, -4>, 4, 1}  
    sphere{<0, 20, -6>, 4, 1} 
    sphere{<-4, 20, -4>, 4, 1}
    sphere{<-6, 20, 0>, 4, 1}
    sphere{<-4, 20, 4>, 4, 1}
    
    sphere{<2, 24, 2>, 4, 1}
    sphere{<2, 24, -2>, 4, 1}
    sphere{<-2, 24, -2>, 4, 1}
    sphere{<-2, 24, 2>, 4, 1}
    
    sphere{<0, 28, 0>, 4, 1}
    
    pigment { color rgb  <0.4,0.75,0.2>}
    normal { bumps 0.4 scale 0.2 }
    finish { phong 0 }
  } 
}    

object{
    tree
    translate pos
    rotate rot
    scale sca
}  
#end
#version Arbre_Inc_Temp
#end