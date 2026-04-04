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
    m.subsurface = 0.5;                                 
    m.specular = 0.35;                                  

    m.clearcoat = 1;
    m.clearcoatGloss = 1;

    m.normalLoops = 15;
    m.normalScale = 0.7;

    m.roughness = 0.65;
    m.roughnessLoops = 5;

    m.subNormalLoops = 5;
    m.subNormalScale = 1;
}

#define PREINTEGRATED_SKIN

#define TEXTURE_PACK0 "../../texture/skin2pack.png"

#define NORMAL_FROM NORMAL_FROM_PACK0
#define NORMAL_CHANNEL rg

#define SUBNORMAL_FROM SUBNORMAL_FROM_PACK0
#define SUBNORMAL_AUTOGEN
#define SUBNORMAL_AUTOGEN_CHANNEL a
#define SUBNORMAL_AUTOGEN_CHANNEL_COUNT 1

#define ROUGHNESS_FROM ROUGHNESS_FROM_PACK0
#define ROUGHNESS_CHANNEL a
#define ROUGHNESS_INVERT

#include "../../../shader/sdPBRMaterialTail.fxsub"



