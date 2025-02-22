#ifndef (Personnage_Inc_Temp)
#declare Personnage_Inc_Temp = version;
#version 3.6;
#declare Font="cyrvetic.ttf"

sky_sphere {
S_Cloud2
}


camera{
    look_at <2,2,2>
    location <3,4,5>
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
	
plane {
  y,-1
  texture {
      pigment { color rgb  <0.4,0.75,0.2>}
      normal { bumps 0.4 scale 0.2 }
      finish { phong 0 }
		} 
		}  
		   
/////////////////////////////////////////////////////////////////////////////////////////// 

// Tous les points pour faire les pattes 
#declare S1 = <2,2,0>; 
#declare P1 = <1.5,1.5,0>;
#declare P1S = <1.5,0.8,0>;
#declare P2 = <2.5,1.5,0>;
#declare P2S = <2.5,0.8,0>;
#declare P1S1 = <1.2,0.8,0.5>;
#declare P1S2 = <1.7,0.8,0.5>;
#declare P1S3 = <1.5,0.8,-0.5>;
#declare P2S1 = <2.2,0.8,0.5>;
#declare P2S2 = <2.7,0.8,0.5>;
#declare P2S3 = <2.5,0.8,-0.5>;
// Tous les points pour faire le blanc des yeux
#declare O1 =<1.5,2.2,0.6>;
#declare O2 =<2.5,2.2,0.6>;
// Points pour faire la pupil
#declare OO1=<1.4,2.2,0.75>;
#declare OO2=<2.6,2.2,0.75>; 
// Les points des ailes

        
#declare aile = union 
{   
    
    difference   // partie jaune 
    {     
        cylinder
        {
            <0,0,0>
            <0,0.2,0>
            1
            pigment{Yellow}         
        } 
        plane
        {
            x
            0        
        }
    } 
    
    difference   // partie rouge 
    {     
        cylinder
        {
            <0,0,0>
            <0,0.2,0>
            1
            pigment{Red}         
        } 
        plane
        {
            x
            0        
        } 
        rotate 180*y
    } 
     
     
    box         // noir centrale 
    {
        <0.15,-0.01,1>
        <-0.15,0.201,-1>
        pigment{Black}
    
    } 
    box         // noir haut 
    {
        <0.15,-0.01,-0.25>
        <-0.9,0.201,-0.45>
        pigment{Black}
    
    } 
    
    box         // noir bas 
    {
        <0.15,-0.01,0.25>
        <-0.9,0.201,0.45>
        pigment{Black}
    
    }
   
} 

#declare titeuf = union // sert de queue et de cheveux
{
    difference
    {
         sphere
         {
          <0,1,0>
          1
          pigment {Red}
         }
         plane
         { 

          y 
          0.3
        } 
 
    }
    scale <0.1,0.8,0.2>
    rotate 45*z


}

#declare natu= 
union
{ 
    merge
    {
    
        blob
        {
            threshold 1.15
            sphere{OO1, 0.2,2}
            sphere{OO2, 0.2,2}
            pigment{color Black}
        }
        
        blob
        {
            threshold 1.15
            sphere{O1, 0.5,2}
            sphere{O2, 0.5,2}
            pigment{color White}
        }
        
        blob
        {
            threshold 1.15
            sphere{S1,1.5,3}
            pigment{color Green}
        }
        
        cone{ 
            <2,2,0> 0.4
            <2,2,2> 0 
            pigment{ color Yellow}
        }
        
        cylinder{ 
            P1 P1S 0.05
            pigment{ Red}
        }
        
        cylinder{
            P2 P2S 0.05
            pigment{ Red}
        }
        
        cylinder{ 
            P1S P1S1 0.04
            pigment{ Red}
        }
        
        cylinder{ 
            P1S P1S2 0.04
            pigment{ Red}
        }
        
        cylinder{ 
            P1S P1S3 0.04
            pigment{ Red}
        } 
        
        cylinder{ 
            P2S P2S1 0.04
            pigment{ Red}
        }
        
        cylinder{ 
            P2S P2S2 0.04
            pigment{ Red}
        } 
        
        cylinder{  
            P2S P2S3 0.04
            pigment{ Red}
        } 
        
        cone {
            <1.2,0.8,0.5> 0.045
            <1.1,0.8,0.7> 0
            pigment{ color White}
        }
        
        cone { 
            <1.7,0.8,0.5> 0.045
            <1.8,0.8,0.7> 0
            pigment{ color White}
        }
        
        cone { 
            <1.5,0.8,-0.5> 0.045
            <1.5,0.8,-0.7> 0
            pigment{ color White}
        } 
    
    }  
    
    
    cone { 
        <2.2,0.8,0.5> 0.045
        <2.1,0.8,0.7> 0
        pigment{ color White}
    }
    
    cone { 
        <2.7,0.8,0.5> 0.045
        <2.8,0.8,0.7> 0
        pigment{ color White }
    }
    
    cone {  
        <2.5,0.8,-0.5> 0.045
        <2.5,0.8,-0.7> 0
        pigment{ color White }
    }  
    
    object
    { 
        aile
        scale <1,0.5,0.5> 
        scale 0.6
        rotate 90*x
        rotate -80*y
        translate <1,2,-0.2> 
    }
    
    object 
    { 
        aile
        scale <1,0.5,0.5> 
        scale 0.6 
        rotate 90*x
        rotate 250*y
        translate <3.1,2,-0.2> 
    }
    
    object 
    { 
        titeuf
        translate <2.9,2.1,0>
    } 
    
    object
    {    
        titeuf 
        rotate 120*x
        rotate 180*y
        translate <3,2.5,-0.5>
        scale 0.7
    }
    
    object 
    { 
        titeuf 
        rotate 120*x
        rotate 260*y
        translate <3,2.5,-0.5>
        scale 0.7
    }
    
    object 
    { 
        titeuf 
        rotate 150*x
        rotate 230*y
        translate <3,2.5,-0.5>
        scale 0.7
    }
    
}



#version Personnage_Inc_Temp;
#end
  