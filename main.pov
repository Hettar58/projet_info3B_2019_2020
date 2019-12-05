#include "colors.inc"
#include "textures.inc"
#include "skies.inc"
#include "math.inc"
#include "transforms.inc"    
#include "woods.inc"
#include "Lit.inc"            
#include "arbre.inc" 
#include "personnage.inc"
#declare Font="cyrvetic.ttf"

sky_sphere {
    S_Cloud2
}


camera{
    look_at <0 ,15, 0>
    location <-25 ,15, -25>
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

fog {
    distance 1000
    color <1.0, 1.0, 1.0> // <red, green, blue>
}

//POINTS centres collines
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
          normal { bumps 0.8 scale 0.2 }
          finish { phong 0 }
        }     
    
    }   

    blob {
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
                                                                                                                 

#declare Hx = 5.00; // moiti� largueur en x
#declare Hy = 5.00; // longueur totale
#declare Hz = 3.00; // longueur en z 
#declare Roof_Angle = 0; // angle 
#declare Wall_D = 0.2; // grosseur 
 
//////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////

arbre(<-2, 0, -15>, <0, 0, 0>, 1)

lit(1)  

