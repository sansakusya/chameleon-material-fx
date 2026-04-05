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
    m.subsurface = 0.5;

    m.specular = 0.1;
    m.specularTint = 0.5;
    m.sheen = 0.2;
    m.sheenTint = 0.5;
    m.roughness = 0.95;
    m.normalLoops = 2;
    m.normalScale = -3;
    m.heightLoops = 2;
    m.heightScale = 0.015;
    m.aoLoops = 2;
    m.aoScale = 0.5;
}

#define TEXTURE_PACK0 "../../texture/knitpack.png"

#define NORMAL_FROM NORMAL_FROM_PACK0
#define NORMAL_CHANNEL rg

#define HEIGHT_FROM HEIGHT_FROM_PACK0
#define PARALLAX_LOOPCOUNT 10
#define HEIGHT_CHANNEL b

#define AO_FROM AO_FROM_PACK0
#define AO_CHANNEL b

#define IGNORE_SP



#include "../../../shader/sdPBRMaterialTail.fxsub"



