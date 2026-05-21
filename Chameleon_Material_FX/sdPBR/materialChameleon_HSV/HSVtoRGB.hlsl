float3 HSVtoRGBf(float3 hsv) {
    float H = hsv.x * 6.0;  // 0.0〜1.0 → 0.0〜6.0にスケール
    float S = hsv.y;
    float V = hsv.z;

    float C = V * S;
    float X = C * (1 - abs(fmod(H, 2) - 1));
    float m = V - C;

    float3 rgb = (H < 1) ? float3(C, X, 0) :
                 (H < 2) ? float3(X, C, 0) :
                 (H < 3) ? float3(0, C, X) :
                 (H < 4) ? float3(0, X, C) :
                 (H < 5) ? float3(X, 0, C) :
                           float3(C, 0, X);

    return rgb + m;  // 明度補正
}