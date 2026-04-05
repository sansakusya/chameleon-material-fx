#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin02H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin02S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin02V"; >;
float 

void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    //基本の設定
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.subsurface = 0.5;
    m.sssColor = pow(float3(ctrl_baseColorR, ctrl_baseColorG, ctrl_baseColorB), GAMMA);
    m.roughness = 1;
    m.specular = 0.35;
    m.clearcoat = 0.3;
    m.clearcoatGloss = 0.3;

    //肌のノーマル・ラフネスマップ
    m.normalLoops = 15;
    m.normalScale = 0.8;
    m.roughnessLoops = 15;

    //水滴用サブノーマル・サブラフネスマップ
    m.subNormalLoops = 8;
    m.subNormalScale = 0.7;
    m.subRoughnessLoops = 8;
}

#define PREINTEGRATED_SKIN

#define ANIMATED_TEXTURE_PACK1 "../../texture/animdrop.png"
#define SUBNORMAL_FROM FROM_PACK1
#define SUBROUGHNESS_FROM FROM_PACK1
#define SUBROUGHNESS_CHANNEL b

#define TEXTURE_PACK0 "../../texture/skin2pack.png"
#define NORMAL_FROM NORMAL_FROM_PACK0
#define ROUGHNESS_FROM ROUGHNESS_FROM_PACK0
#define ROUGHNESS_CHANNEL b

#include "../../../shader/sdPBRMaterialTail.fxsub"



