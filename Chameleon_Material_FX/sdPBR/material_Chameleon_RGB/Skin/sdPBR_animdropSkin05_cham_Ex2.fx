#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerRGB.pmx"

float ctrl_baseColorR : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05R+"; >;
float ctrl_baseColorG : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05G+"; >;
float ctrl_baseColorB : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05B+"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05V-"; >;

/* 設定用の定数 */

//水滴周囲の影の濃さ
const float _Droplet_Shadow = 0.25;

//アニメーション サブ法線マップ
texture _AnimDropMap : ANIMATEDTEXTURE < string ResourceName = "../../texture/animdrop.png";>;
sampler _AnimDropSamp = sampler_state {
    Texture = <_AnimDropMap>;
    MinFilter = ANISOTROPIC; MagFilter = ANISOTROPIC; MipFilter = LINEAR; MaxAnisotropy = MAX_ANISOTROPY;
    ADDRESSU = WRAP; ADDRESSV = WRAP;
};

void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    //基本の設定
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    m.baseColor = float3(monoColor, monoColor, monoColor);
    m.baseColor *= float3(0.01+ctrl_baseColorR, 0.01+ctrl_baseColorG, 0.01+ctrl_baseColorB)*(1-ctrl_baseColorV);
    m.subsurface = 0.5;
    m.sssColor = pow(float3(ctrl_baseColorR, ctrl_baseColorG, ctrl_baseColorB), GAMMA);
    m.roughness = 0.55;
    m.specular = 0.35;
    m.clearcoat = 0.3;
    m.clearcoatGloss = 0.3;

    //肌のノーマル・ラフネスマップ
    m.normalLoops = 15;
    m.normalScale = 0.8;
    m.roughnessLoops = 15;

    //水滴用サブノーマル・サブラフネスマップ
    m.subNormalLoops = 8;
    m.subNormalScale = 3;
    m.subRoughnessLoops = 8;
}

float2 _GetSubNormal(inout Material m, float3 n, float3 Eye, float2 uv)
{
    float4 t = tex2D(_AnimDropSamp, uv);
    m.roughness *= t.b;   //subroughness代わり

    //m.baseColor = lerp(0.7,m.baseColor,exp(-(1-t.b))); //なんですかねえ、これは

    m.baseColor *= 1 - saturate(length(t.xy*2-1))*_Droplet_Shadow; //強化AOによる水滴の影
    return t.rg;
}

#define PREINTEGRATED_SKIN
//#define IRIDESCENCE

#define SUBNORMAL_DROPLET

#define SUBNORMAL_FROM FROM_CODE
#define SUBNORMAL_CODE _GetSubNormal

#define TEXTURE_PACK0 "../../texture/skin2pack.png"
#define NORMAL_FROM NORMAL_FROM_PACK0
#define ROUGHNESS_FROM ROUGHNESS_FROM_PACK0
#define ROUGHNESS_CHANNEL b

#include "../../../shader/sdPBRMaterialTail.fxsub"

