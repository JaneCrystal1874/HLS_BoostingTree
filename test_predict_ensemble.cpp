////0.680181917680307,0.68488474333604,0.736979270797513,0.716090468240183,0.439444898233482,0.534090909090906,0.609912070343725,0.698292220113852,0.665092184281496,0.511757555395279,0.389780878028486,0.637005249522195,0.689831750387776
//#include "ap_fixed.h"
//#include "hls_math.h"
//#include "Tree_Param.hpp"
//
//#define FEATURE_SIZE 13 // 特征数量
//#define N_TREES 64 // 树数量
//
//// 声明顶层函数
//float predict_ensemble(const float features[FEATURE_SIZE]);
//
//int main() {
//    // 定义输入特征数组
//    float features[FEATURE_SIZE] = {
//    		0.680181917680307,0.68488474333604,0.736979270797513,
//			0.716090468240183,0.439444898233482,0.534090909090906,
//			0.609912070343725,0.698292220113852,0.665092184281496,
//			0.511757555395279,0.389780878028486,0.637005249522195,
//			0.689831750387776
//    };
//
//    // 调用预测函数
//    float result = predict_ensemble(features);
//
//    // 打印输出结果
//    std::cout << "Prediction result: " << result << std::endl;
//
//    // 验证结果是否正确（可选）
//    float expected_result = 95.0; // 假设预期结果（根据具体需求调整）
//    if (fabs(result - expected_result) < 5) {
//        std::cout << "Test passed!" << std::endl;
//    } else {
//        std::cout << "Test failed!" << std::endl;
//    }
//
//    return 0;
//}

#include <hls_stream.h>
#include <cmath>
#include <iostream>
#define FEATURE_SIZE 13
#define N_TREES 64    // 假设决策树数量
#define MAX_NODE 196    // 假设最大节点深度

void predict_ensemble(hls::stream<float>& feature_stream,
                    hls::stream<float>& prediction_stream);
// 流数据生成器
void generate_feature_stream(const float features[FEATURE_SIZE],
                           hls::stream<float>& feature_stream) {
    for(int i=0; i<FEATURE_SIZE; i++) {
        feature_stream.write(features[i]);
    }
}
// 结果验证函数
bool verify_result(float actual, float expected, float tolerance=1e-3) {
    return std::abs(actual - expected) <= tolerance;
}
int main()
{
    // 初始化测试数据
    const float test_features[FEATURE_SIZE] = {
    		0.680181917680307,0.68488474333604,0.736979270797513,
			0.716090468240183,0.439444898233482,0.534090909090906,
			0.609912070343725,0.698292220113852,0.665092184281496,
			0.511757555395279,0.389780878028486,0.637005249522195,
			0.689831750387776
    };
    const float expected_result = 95; // 需要替换为真实预期值

    hls::stream<float> feature_stream("input_stream");
    hls::stream<float> prediction_stream("output_stream");
    // 阶段1: 通过流接口输送测试数据
    generate_feature_stream(test_features, feature_stream);

    // 阶段2: 执行预测模型
    predict_ensemble(feature_stream, prediction_stream);

    // 阶段3: 捕获输出流结果
    float result;
    if(!prediction_stream.empty()) {
        result = prediction_stream.read();
    } else {
        std::cerr << "Error: Output stream is empty!" << std::endl;
        return 1;
    }
    // 结果验证与报告
    std::cout << "===== TEST REPORT =====" << std::endl;
    std::cout << "Predict result:" << std::fixed << result << std::endl;
    std::cout << "Expect result:" << expected_result << std::endl;

    if (fabs(result - expected_result) < 5) {
        std::cout << "Test passed!" << std::endl;
    } else {
        std::cout << "Test failed!" << std::endl;
    }
}
