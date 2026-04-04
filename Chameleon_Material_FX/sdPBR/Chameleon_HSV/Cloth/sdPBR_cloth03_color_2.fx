#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth03H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth03S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth03V"; >;
float 


void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.subsurface = 0.2;
    m.roughness = 0.5;
    m.specular = 0.1;
    m.sheen = 1;
    m.sheenTint = 0;
    m.anisotropic = 0.8;
}

#include "../../../shader/sdPBRMaterialTail.fxsub"



