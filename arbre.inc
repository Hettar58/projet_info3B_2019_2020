#ifndef (Arbre_Inc_Temp)
#declare Arbre_Inc_Temp = version;
#version 3.6;
       
         



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


#version Arbre_Inc_Temp
#end