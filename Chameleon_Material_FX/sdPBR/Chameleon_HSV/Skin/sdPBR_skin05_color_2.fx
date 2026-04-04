#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05V"; >;
float 


void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.subsurface = 0.66;
    //m.sssColor = float3(0.6,0.1,0.1);
    m.sssColor = pow(float3(ctrl_baseColorR, ctrl_baseColorG, ctrl_baseColorB), GAMMA);
    m.specular = 0.35;
    m.roughness = 0.4;
    m.clearcoat = 0.45;
    m.clearcoatGloss = 0.6;
    m.normalLoops = 20;
    m.normalScale = 0.6;
}

#define NORMAL_FROM NORMAL_FROM_FILE
#define NORMAL_FILE "../../texture/Skin_Human_002_NRM.png"


#include "../../../shader/sdPBRMaterialTail.fxsub"


