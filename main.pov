#include "colors.inc"
#include "textures.inc"
#include "skies.inc"
#include "math.inc"

#declare Font="cyrvetic.ttf"

sky_sphere {S_Cloud5 rotate <90,0.051, 1>}

camera{
    look_at <0, 0, 0>
    location <0, 20, 2>
    sky<0, 0, 1>
    right <-800/600, 0, 0>
}

light_source{
    <5, 5, 5>
    colour rgb<1,1,1>
}

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


#declare origine=<0, 0, 0>;
#declare I=<1, 0, 0>;
#declare J=<0, 1, 0>;
#declare K=<0, 0, 1>;
#declare alph=0.6;
#declare rCyl=0.05;
#declare rCone=0.15;
#declare sca=0.3;

flecheNom(origine, I, rgb<1, 0, 0>, alph, rCyl, rCone, "X", sca, <0, 0, 0>, <0.5, 0.2, 0>)
flecheNom(origine, J, rgb<0, 1, 0>, alph, rCyl, rCone, "Y", sca, <0, 0, 0>, <0.2, 0.5, 0>)
flecheNom(origine, K, rgb<0, 0, 1>, alph, rCyl, rCone, "Z", sca, <0, -90, 0>, <0, 0.1, 0.5>)
