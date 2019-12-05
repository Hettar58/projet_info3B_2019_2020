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
#declare echelle = 2 ; 

//animation//////////////

#declare time=clock ;

#if (time<0.5)
#declare anim = 1;

#end 
#if (time>=0.5 & time<0.7)
#declare anim = 2;

#end


#if (time>=0.7 & time<0.9)
#declare anim = 3;

#end

#if (time>=0.9 )
#declare anim = 4;

#end


#switch (anim)

    #case (1) 
        #declare O1 = 8.5+cos(time*30)*-2+2;  
        #declare O2 = 8.5+cos(time*28)*-1.9+1.9; 
        #declare O3 = 8.5+cos(time*25)*-1.7+1.7; 
        #declare O4 = 8.5+cos(time*22)*-1.3+1.3; 
        #declare O5 = 8.5+cos(time*17)*-1+1; 
        object
        {
         natu      
         
         translate <-2,O5,-2> 
         rotate -90*y   
          scale echelle *1
        }    
        object
        {
         natu      
         
         translate <2,O2,0> 
         rotate -90*y   
          scale echelle *1
        } 
        object
        {
         natu      
         
         translate <0,O3,-5> 
         rotate -90*y   
          scale echelle *1
        } 
        object
        {
         natu      
         
         translate <3,O4,-3> 
         rotate -90*y   
          scale echelle *1
        } 
        object
        {
         natu      
         
         translate <-3.2,O1,-7> 
         rotate -90*y   
          scale echelle 
        } 
        sphere 
        { 
        <0,0,0>
        2
        pigment{Brown}   
        scale <1,1.2,1> 
        scale 0.8
        translate <14,40,-3>
        
        
        
        }

        
    
    #break




#end 
camera{
    look_at <10 ,25, 0>
    location <-30 ,25, -25>
    sky<0, 1,0 >
    right <-800/600, 0, 0>
}






 
object
{
 lit 
 scale echelle*2
}   








































sky_sphere {
    S_Cloud2
}




light_source {
    <200,50,50>
   color rgb <0.8,0.7,0.8>
}
	
light_source
{
	<40,30,70>
	color  rgb <1,0.8,0.8>
	spotlight
	point_at <0,0,0>
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
        y,0
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
                                                                                                             

#declare Hx = 5.00; // moiti� largueur en x
#declare Hy = 5.00; // longueur totale
#declare Hz = 3.00; // longueur en z 
#declare Roof_Angle = 0; // angle 
#declare Wall_D = 0.2; // grosseur 
 
//////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////

