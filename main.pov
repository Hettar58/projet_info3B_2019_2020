#include "colors.inc"
#include "textures.inc"
#include "skies.inc"
#include "math.inc"
#include "transforms.inc"    
#include "woods.inc"
#include "Lit.inc" 
#declare Font="cyrvetic.ttf"

sky_sphere {
S_Cloud2
}


camera{
    look_at <400, 30, 0>
    location <-100,10, -50>
    sky<0, 1,0 >
    right <-800/600, 0, 0>
}

light_source {
<200,0,50>
color rgb <0.8,0.7,0.8>
}	
light_source
{
	<40,30,70>
	color  rgb <1,0.8,0.8>
	spotlight
	point_at <10,0,20>
	radius 40
	falloff 60	
	}
	
light_source
{
	<180,100,70>
	color  rgb <1,0.8,0.8>
	spotlight
	point_at <100,44,6>
	radius 20
	falloff 30	
	}

#declare P1=<500,-10,500>;
#declare P2=<400,-1,100>;
#declare P3=<800,-5,120>;
#declare P4=<500,-5,-50>;
#declare P5=<500,-1,-100>;
#declare P6=<500,-1,-200>;
#declare P7=<450,-1,-300>;
merge{
plane {
  y,-1
  texture {
      pigment { color rgb  <0.4,0.75,0.2>}
      normal { bumps 0.4 scale 0.2 }
      finish { phong 0 }
		}     

       }
blob{
 threshold 1.15
   sphere{P1,100,50}
   sphere{P2,50,50}
   sphere{P3,100,100}
   sphere{P4,100,200}
   sphere{P5,50,200}
   sphere{P6,100,200}
   sphere{P7,200,200}
   texture {
      pigment { color rgb  <0.4,0.75,0.2>}
      normal { bumps 0.4 scale 0.2 }
      finish { phong 0 }
		} 
  } 
  
////////////////////////////////////////////////////////////////////
#macro flecheNom (A, S, Coul, alph, rCyl, rCone, Text1, sca, rot, trans)
#declare B=alph*A+alph*S;
cylinder{
    B, A, rCyl
    pigment{
        color Coul
    }
}

cone{
    B, rCone
    S, 0.0
    pigment{
        color Coul
    }
}
text{
    ttf "timrom.ttf"
    Text1
    0
    0
    scale sca
    rotate rot
    translate trans
    pigment{
        color Coul
    }
}
#end

//#declare origine=<0, 0, 0>;
//#declare I=<1, 0, 0>;
//#declare J=<0, 1, 0>;
//#declare K=<0, 0, 1>;
//#declare alph=0.6;
//#declare rCyl=0.05;
//#declare rCone=0.15;                                  
//#declare sca=0.3;

//flecheNom(origine, I, rgb<1, 0, 0>, alph, rCyl, rCone, "X", sca, <0, 0, 0>, <0.5, 0.2, 0>)
//flecheNom(origine, J, rgb<0, 1, 0>, alph, rCyl, rCone, "Y", sca, <0, 0, 0>, <0.2, 0.5, 0>)
//flecheNom(origine, K, rgb<0, 0, 1>, alph, rCyl, rCone, "Z", sca, <0, -90, 0>, <0, 0.1, 0.5>)   
                                                                                                                 

#declare Hx = 5.00; // moitié largueur en x
#declare Hy = 5.00; // longueur totale
#declare Hz = 3.00; // longueur en z 
#declare Roof_Angle = 0; // angle 
#declare Wall_D = 0.2; // grosseur 
 
//////////////////////////////////////////////////////////////////

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

#declare arbre =
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
}
object{
    arbre
    translate<-2,0,-15>
    }

//lit(1)
           
#declare HF_Res_X = 1024; // number of points in x
#declare HF_Res_Z = 1024; // number of points in z
#declare SF =
 function {
   pigment {
   spherical
     color_map {
       [0.0, color 0.0 ]
       [0.5, color 0.8 ]
       [1.0, color 1.0 ]
     } // end color_map
    scale <0.5,1,0.5>
    translate<0.5,0,0.5>
   } // end pigment
 } // end function

#declare HF_Function   =
 function(x, y, z)
  {1+f_snoise3d(x*10,y*10,z*10)*0.3 * SF(x,y,z).gray}

#declare HF_Amplitude    = 0.5;
#declare D = 0.00001; // just a little bit!

union{ // height_field + ground
 intersection{
  height_field{
   function  HF_Res_X, HF_Res_Z
   { HF_Function(x,0,y) * HF_Amplitude }
   //smooth
    translate<0,D-0.4 ,0>
   } // end HF
  box{ <D,-0.10,D>,<1-D,0.2-D,1-D>
   } // end box
  translate<0,-0.10,0>
 } // end intersection

difference{ // ground minus hole for height_field
 plane { <0,1,0>, 0 }   // plane of the ground
 box{ <D,-0.10,D>,<1-D,0.2-D,1-D> }
 } // end difference

 scale <1,1,1>
 translate<0,0,0>
 pigment {image_map{gif "herbe.gif" map_type 0}}
           normal { bumps 0.75 scale 0.0025 }
           finish { phong 0.1 }
         }// end textures
