#ifndef(   Lit_Inc_Temp)
#declare Lit_Inc_Temp = version;
#version 3.6;

#declare Font="cyrvetic.ttf"                                 
                                 
                                 
#macro getLit(pos, rot, sca)    

#declare pied = 
merge{

    lathe {
        bezier_spline
        4, // nombre de points
        <1,0> <1,0.5> <0.5,0.75> <0.2,1>
        texture {
            DMFWood4
        }
    } 

    lathe {
        bezier_spline
        4, // nombre de points
        <0,0> <1,0> <0.2,1> <1,3>
        texture {
            DMFWood4
        }
     }
}

#declare oreiller =
union{
    sphere{<1, 0, 5> 1.0 pigment{color White}}
    
    union{
        sphere{<1, 0, 0> 1.0 pigment{color White}}
        
        cylinder{<1, 0, 0>, <1, 0, 5>, 1.0 pigment{color White}}
    }
}  

#declare lit =
union{
    object{ oreiller translate<8, 5, 0>}
    
    merge{
        box{ <-1.1,3.5,-1.1> <5,4.7,5.1> pigment {rgb<0,0,1>}}    //couverture
        
        merge{
            box{ <-1,3.5,-1> <9,4.5,5> pigment {rgb<1,1,1>}}     //matelas
            
            union{
                object {pied}
                
                union{
                    object {pied translate< 0, 0, 4>}
                    
                    union{
                        object {pied translate< 8, 0, 0>}
                        
                        union{
                            object {pied translate< 8, 0, 4>}
                            
                            box{<-1,3,-1> <9,3.5,5> texture{DMFWood1}}  //sommier
                        }
                    }
                }
            }
        }
    }
}

#object{
    lit
    translate pos
    rotate rot
    scale sca
}                   

#end

#version   Lit_Inc_Temp;
#end
