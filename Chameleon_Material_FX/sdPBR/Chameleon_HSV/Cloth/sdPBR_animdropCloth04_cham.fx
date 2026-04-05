#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth04H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth04S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth04V"; >;
float 


void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.baseColor *= 0.8;
    m.subsurface = 0.2;
    m.roughness = 1;
    m.specular = 0.5;
    m.sheen = 1;

    //水滴用ノーマル・ラフネスマップ
    m.normalLoops = 8;
    m.normalScale = 0.7;
    m.roughnessLoops = 8;
}

#define ANIMATED_TEXTURE_PACK1 "../../texture/animdrop.png"
#define NORMAL_FROM FROM_PACK1
#define ROUGHNESS_FROM FROM_PACK1
#define ROUGHNESS_CHANNEL b


#include "../../../shader/sdPBRMaterialTail.fxsub"



