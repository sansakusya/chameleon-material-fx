#define SDPBR_MATERIAL_VER 100
#include "../../../shader/sdPBRMaterialHead.fxsub"
#include "../HSVtoRGB.hlsl"

#define MATERIAL_CONTROLLER "sdPBRChameleonControllerHSV.pmx"

float ctrl_baseColorH : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05H"; >;
float ctrl_baseColorS : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05S"; >;
float ctrl_baseColorV : CONTROLOBJECT < string name = MATERIAL_CONTROLLER; string item = "Skin05V"; >;
float 


void SetMaterialParam(inout Material m, float3 n,float3 l, float3 Eye, float2 uv)
{
    float monoColor = (m.baseColor.r + m.baseColor.g + m.baseColor.b)/3;
    static const float3 hsv = float3(ctrl_baseColorH, ctrl_baseColorS, ctrl_baseColorV);
    static float3 rgb = HSVtoRGBf(hsv);
    m.baseColor = float3(0.01+rgb.r, 0.01+rgb.g, 0.01+rgb.b);
    m.subsurface = 0.9;
    //m.baseColor *= float3(0.9, 0.75,0.7); //ì˙èƒÇØÇà”éØÇµÇΩÅAÇÊÇËîZÇ¢îßêFÇ…ÇµÇΩÇ¢èÍçáÇÕÇ±Ç¡ÇøÇ‡Ç«Ç§Çº
    //m.sssColor = pow(float3(1, 0.8, 0.64), GAMMA);
    m.sssColor = pow(float3(ctrl_baseColorR, ctrl_baseColorG, ctrl_baseColorB), GAMMA);
    m.specular = 0.5;
    m.specularTint = 0;
    m.roughness = 1;
    m.subNormalLoops = 10;
    m.subNormalScale = -1;
    m.normalLoops = 20;
    m.normalScale = 0.6;
    m.roughnessLoops = 10;
}

//#define SUBNORMAL_DROPLET
#define NORMAL_FROM FROM_FILE
#define NORMAL_FILE "../../texture/Skin_Human_002_NRM.png"

#define TEXTURE_PACK0 "../../texture/wetpack.png"
#define SUBNORMAL_FROM FROM_PACK0
#define SUBNORMAL_CHANNEL rg

#define ROUGHNESS_FROM FROM_PACK0
#define ROUGHNESS_CHANNEL b


#include "../../../shader/sdPBRMaterialTail.fxsub"



