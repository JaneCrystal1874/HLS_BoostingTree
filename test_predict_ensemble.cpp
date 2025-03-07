//0.680181917680307,0.68488474333604,0.736979270797513,0.716090468240183,0.439444898233482,0.534090909090906,0.609912070343725,0.698292220113852,0.665092184281496,0.511757555395279,0.389780878028486,0.637005249522195,0.689831750387776
#include "ap_fixed.h"
#include "hls_math.h"
#include "Tree_Param.hpp"

#define FEATURE_SIZE 13 // ��������
#define N_TREES 64 // ������

// �������㺯��
float predict_ensemble(const float features[FEATURE_SIZE]);

int main() {
    // ����������������
    float features[FEATURE_SIZE] = {
    		0.680181917680307,0.68488474333604,0.736979270797513,
			0.716090468240183,0.439444898233482,0.534090909090906,
			0.609912070343725,0.698292220113852,0.665092184281496,
			0.511757555395279,0.389780878028486,0.637005249522195,
			0.689831750387776
    };

    // ����Ԥ�⺯��
    float result = predict_ensemble(features);

    // ��ӡ������
    std::cout << "Prediction result: " << result << std::endl;

    // ��֤����Ƿ���ȷ����ѡ��
    float expected_result = 95.0; // ����Ԥ�ڽ�������ݾ������������
    if (fabs(result - expected_result) < 5) {
        std::cout << "Test passed!" << std::endl;
    } else {
        std::cout << "Test failed!" << std::endl;
    }

    return 0;
}
