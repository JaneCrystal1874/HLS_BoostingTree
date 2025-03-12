////0.680181917680307,0.68488474333604,0.736979270797513,0.716090468240183,0.439444898233482,0.534090909090906,0.609912070343725,0.698292220113852,0.665092184281496,0.511757555395279,0.389780878028486,0.637005249522195,0.689831750387776
//#include "ap_fixed.h"
//#include "hls_math.h"
//#include "Tree_Param.hpp"
//
//#define FEATURE_SIZE 13 // ��������
//#define N_TREES 64 // ������
//
//// �������㺯��
//float predict_ensemble(const float features[FEATURE_SIZE]);
//
//int main() {
//    // ����������������
//    float features[FEATURE_SIZE] = {
//    		0.680181917680307,0.68488474333604,0.736979270797513,
//			0.716090468240183,0.439444898233482,0.534090909090906,
//			0.609912070343725,0.698292220113852,0.665092184281496,
//			0.511757555395279,0.389780878028486,0.637005249522195,
//			0.689831750387776
//    };
//
//    // ����Ԥ�⺯��
//    float result = predict_ensemble(features);
//
//    // ��ӡ������
//    std::cout << "Prediction result: " << result << std::endl;
//
//    // ��֤����Ƿ���ȷ����ѡ��
//    float expected_result = 95.0; // ����Ԥ�ڽ�������ݾ������������
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
#define N_TREES 64    // �������������
#define MAX_NODE 196    // �������ڵ����

void predict_ensemble(hls::stream<float>& feature_stream,
                    hls::stream<float>& prediction_stream);
// ������������
void generate_feature_stream(const float features[FEATURE_SIZE],
                           hls::stream<float>& feature_stream) {
    for(int i=0; i<FEATURE_SIZE; i++) {
        feature_stream.write(features[i]);
    }
}
// �����֤����
bool verify_result(float actual, float expected, float tolerance=1e-3) {
    return std::abs(actual - expected) <= tolerance;
}
int main()
{
    // ��ʼ����������
    const float test_features[FEATURE_SIZE] = {
    		0.680181917680307,0.68488474333604,0.736979270797513,
			0.716090468240183,0.439444898233482,0.534090909090906,
			0.609912070343725,0.698292220113852,0.665092184281496,
			0.511757555395279,0.389780878028486,0.637005249522195,
			0.689831750387776
    };
    const float expected_result = 95; // ��Ҫ�滻Ϊ��ʵԤ��ֵ

    hls::stream<float> feature_stream("input_stream");
    hls::stream<float> prediction_stream("output_stream");
    // �׶�1: ͨ�����ӿ����Ͳ�������
    generate_feature_stream(test_features, feature_stream);

    // �׶�2: ִ��Ԥ��ģ��
    predict_ensemble(feature_stream, prediction_stream);

    // �׶�3: ������������
    float result;
    if(!prediction_stream.empty()) {
        result = prediction_stream.read();
    } else {
        std::cerr << "Error: Output stream is empty!" << std::endl;
        return 1;
    }
    // �����֤�뱨��
    std::cout << "===== TEST REPORT =====" << std::endl;
    std::cout << "Predict result:" << std::fixed << result << std::endl;
    std::cout << "Expect result:" << expected_result << std::endl;

    if (fabs(result - expected_result) < 5) {
        std::cout << "Test passed!" << std::endl;
    } else {
        std::cout << "Test failed!" << std::endl;
    }
}
