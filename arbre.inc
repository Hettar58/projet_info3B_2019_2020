#ifndef (Arbre_Inc_Temp)
#declare Arbre_Inc_Temp = version;
#version 3.6
       
#macro arbre(pos, rot, sca)         
/*
#declare A1 =<-2,10,0>;// points blob arbres 
#declare A2 =<-4,12,0>;
#declare A3 =<-2,10,0>;
#declare A4 =<-2,10,0>;
#declare A5 =<-2,14,3>;
#declare A6 =<-2,16,1>;
#declare A7 =<0,18,0>;
#declare A8 =<2,10,2>;
#declare A9 =<3,15,2>;

#declare C1 =<0,0,0>; //Points du tronc d'arbre
#declare C2 =<0,10,0>;
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
    threshold 1.15
    sphere{A1,4,5}
    sphere{A2,3,4}
    sphere{A3,4,4}
    sphere{A4,6,2}  
    sphere{A5,4,4} 
    sphere{A6,5,7}
    sphere{A7,7,5}
    sphere{A8,6,4}
    sphere{A9,4,4}
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
}  */
#declare A = <3, 0>;     //base lathe
#declare B = <2, 0>;     //base lathe
#declare C = <1, 1>;     //base lathe
#declare D = <1, 2>;     //base lathe

#declare E = <0, 0, 0>;  //pt tronc (cylindre)
#declare F = <0, 15, 0>;  //pt tronc           

#declare G = <1, 15>;   //haut lathe
#declare H = <1, 16>;
#declare I = <2, 17>;
#declare J = <3, 17>;     

#declare K = <


lathe{
    bezier_spline  
    4,
    A B C D
    pigment{ color White }
}   

cylinder{
     E F 1.0
     pigment{ color White }
}    
     
     
     
/*lathe{
    bezier_spline
    4,
    G H I J
    pigment{color White}
}       */


#end

#version Arbre_Inc_Temp
#end