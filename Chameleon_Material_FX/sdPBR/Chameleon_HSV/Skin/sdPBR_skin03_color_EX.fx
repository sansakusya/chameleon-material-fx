#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin03H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin03S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin03V"; >;
float 


void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.subsurface = 0.5;                                 //←の値で透明感を調整できます。低くすると固い感じの皮膚になります
    //m.baseColor *= pow(float3(1, 0,9, 0,9), GAMMA);    //大体の肌色の調整は元のbaseColorと乗算すると行えます
    m.specular = 0.35;                                  //今回の肌マテリアルはデフォルトで白い肌設定です
    m.roughness = 0.65;
    m.clearcoat = 0.3;
    m.clearcoatGloss = 0.3;
    m.normalLoops = 20;
    m.normalScale = 0.6;
}

//xNormalなどのツールを使ってCurvature(曲率)マップを作り、sdPBRのsubsurfaceマップに指定すると
//皮膚の部分ごとに細かく透過具合を設定できます
//m.subsurfaceの値がテクスチャに書いてある値に乗算されるので、subsurfaceマップを使う場合は
//基本的にm.subsurfaceを1.0に設定して、透明感が強すぎる場合だけ下げるような感じで調整しましょう

//このシンボルがONになっているとpre-integrated skinシェーディングモデルを使います
//pre-intergated skinにするとm.subsurface値を曲率とみなして計算を行います
#define PREINTEGRATED_SKIN

#define NORMAL_FROM NORMAL_FROM_FILE
#define NORMAL_FILE "../../texture/Skin_Human_002_NRM.png"


#include "../../../shader/sdPBRMaterialTail.fxsub"



