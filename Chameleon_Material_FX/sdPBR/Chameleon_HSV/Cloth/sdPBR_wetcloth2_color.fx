#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "ClothH"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "ClothS"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "ClothV"; >;



texture _Wetpack : TEXTURE < string ResourceName = "../../texture/wetpack.png";>;
sampler _WetpackSamp = sampler_state {
    Texture = <_Wetpack>;
    MinFilter = ANISOTROPIC; MagFilter = ANISOTROPIC; MipFilter = LINEAR; MaxAnisotropy = MAX_ANISOTROPY;
    ADDRESSU = WRAP; ADDRESSV = WRAP;
};

void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);   
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.baseColor *= 0.8;
    m.subsurface = 0.2;
    m.roughness = 0.2;
    m.specular = 0.5;
    m.sheen = 1;
    m.anisotropic = 0.8;
    m.subNormalLoops = 3;
    m.subNormalScale = -5;
}

float2 _GetSubNormal(inout Material m, float3 n, float3 Eye, float2 uv)
{
    float4 t = tex2D(_WetpackSamp, uv);
    m.roughness *= 1-t.b;   //subroughness‘ã‚í‚è
    m.ambientVisibility.x = m.lightVisibility.x = 1 - saturate(length(t.xy*2-1))*0.5; //‚Ä‚«‚Æ‚¤‹­‰»AO
    return t.rg;
}

#define SUBNORMAL_DROPLET

#define SUBNORMAL_FROM FROM_CODE
#define SUBNORMAL_CODE _GetSubNormal



#include "../../../shader/sdPBRMaterialTail.fxsub"
