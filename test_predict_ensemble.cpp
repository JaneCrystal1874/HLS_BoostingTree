//0.680181917680307,0.68488474333604,0.736979270797513,0.716090468240183,0.439444898233482,0.534090909090906,0.609912070343725,0.698292220113852,0.665092184281496,0.511757555395279,0.389780878028486,0.637005249522195,0.689831750387776
#include "ap_fixed.h"
#include "hls_math.h"
#include "Tree_Param.hpp"

#define FEATURE_SIZE 13 // 特征数量
#define N_TREES 64 // 树数量

// 声明顶层函数
float predict_ensemble(const float features[FEATURE_SIZE]);

int main() {
    // 定义输入特征数组
    float features[FEATURE_SIZE] = {
    		0.680181917680307,0.68488474333604,0.736979270797513,
			0.716090468240183,0.439444898233482,0.534090909090906,
			0.609912070343725,0.698292220113852,0.665092184281496,
			0.511757555395279,0.389780878028486,0.637005249522195,
			0.689831750387776
    };

    // 调用预测函数
    float result = predict_ensemble(features);

    // 打印输出结果
    std::cout << "Prediction result: " << result << std::endl;

    // 验证结果是否正确（可选）
    float expected_result = 95.0; // 假设预期结果（根据具体需求调整）
    if (fabs(result - expected_result) < 5) {
        std::cout << "Test passed!" << std::endl;
    } else {
        std::cout << "Test failed!" << std::endl;
    }

    return 0;
}
