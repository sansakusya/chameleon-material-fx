#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "HairH"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "HairS"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "HairV"; >;



void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);   
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.roughness = 0.35;
    m.anisotropic = 0.7;
    m.specular = 0.22;
    m.specularTint = 0.8;
    m.anisoAngleX = 0.25;
    m.normalScale = 0.5;
    m.normalLoops = 3;
}

#define ANISOTROPIC_FUZZ

#define TEXTURE_PACK0 "../../texture/hair_normal.jpg"
#define NORMAL_FROM NORMAL_FROM_PACK0
//#define SPECULAR_FROM SPECULAR_FROM_PACK0

//#define SUBNORMAL_FROM SUBNORMAL_FROM_TEX
//#define SUBNORMAL_AUTOGEN

#include "../../../shader/sdPBRMaterialTail.fxsub"