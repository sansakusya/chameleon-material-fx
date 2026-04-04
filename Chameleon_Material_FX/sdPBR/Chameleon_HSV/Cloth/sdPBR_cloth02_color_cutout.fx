//ある一定のα値以下の部分をカットするマテリアル
//フリルやレースの部分の周囲が黒くなるような時向け

#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth02H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth02S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Cloth02V"; >;
float 


void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.subsurface = 0.1;
    m.roughness = 0.9;
    m.specular = 0.15;
    m.sheen = 0.5;
    m.sheenTint = 0.5;
    m.anisotropic = 0.5;
}


//このα値以下の物体は描画しない
//ライトから無視される分だけ描画しないことにしてライティングとの一貫性を保つ
#define ALPHA_CUTOFF_THRESHOLD LIGHTALPHA_THRESHOLD

//残った部分のα値は1.0とみなす
#define BINARY_ALPHA

#include "../../../shader/sdPBRMaterialTail.fxsub"



