#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin04H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin04S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin04V"; >;
float 


//skinEX2をベースに曲率を推定する部分を入れたバリエーション
//中の詰まっている感じが出ます
void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    float c = saturate(length(fwidth(n)) / length(fwidth(Eye*80))); //曲率[1/mm]  80はMMD長さ→mmへの変換係数
    //曲率そのままだとポリ割りが目立つ事が多いので0～1 → 0.25～0.75にリマップして薄める
    //あんまり良い事ではないんだけどガタガタするよりはヨシ
    m.subsurface = lerp(0.25,0.75,c);
    m.specular = 0.35;
    m.roughness = 0.5;
    m.clearcoat = 1;
    m.clearcoatGloss = 0.8;
    m.normalLoops = 15;
    m.normalScale = 0.8;
    m.roughnessLoops = 15;
}

#define PREINTEGRATED_SKIN
#define TEXTURE_PACK0 "../../texture/skin2pack.png"

#define NORMAL_FROM NORMAL_FROM_PACK0
#define NORMAL_CHANNEL rg

#define ROUGHNESS_FROM ROUGHNESS_FROM_PACK0
#define ROUGHNESS_CHANNEL b


#include "../../../shader/sdPBRMaterialTail.fxsub"



