#include "ap_fixed.h"
#include "hls_math.h"
#include "hls_stream.h"
#include "ap_axi_sdata.h"
#include <cmath>
#include <iostream>
#define FEATURE_SIZE 4
#define N_TREES 64    //  �������������
#define MAX_NODE 32    // �������ڵ����


void predict_ensemble(hls::stream<float>& feature_stream,
		hls::stream<float>& prediction_sbp,
		hls::stream<float>& prediction_dbp);
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
    		0.944461,
			0.687983,
			0.71,
			0.859922
    };
    const float expected_sbp = 95; // ��Ҫ�滻Ϊ��ʵԤ��ֵ
    const float expected_dbp = 95; // ��Ҫ�滻Ϊ��ʵԤ��ֵ

    hls::stream<float> feature_stream("input_stream");
    hls::stream<float> prediction_sbp("sbp");
    hls::stream<float> prediction_dbp("dbp");

    // �׶�1: ͨ�����ӿ����Ͳ�������
    generate_feature_stream(test_features, feature_stream);

    // �׶�2: ִ��Ԥ��ģ��
    predict_ensemble(feature_stream, prediction_sbp,prediction_dbp);

    // �׶�3: ������������
    float result;
    if(!prediction_sbp.empty()) {
        result = prediction_sbp.read();
    } else {
        std::cerr << "Error: Output stream is empty!" << std::endl;
        return 1;
    }
    // �����֤�뱨��
    std::cout << "===== TEST REPORT =====" << std::endl;
    std::cout << "Predict sbp:" << std::fixed << result << std::endl;
    std::cout << "Expect result:" << expected_sbp << std::endl;

    if (fabs(result - expected_sbp) < 5) {
        std::cout << "Test passed!" << std::endl;
    } else {
        std::cout << "Test failed!" << std::endl;
    }


    if(!prediction_dbp.empty()) {
		result = prediction_dbp.read();
	} else {
		std::cerr << "Error: Output stream is empty!" << std::endl;
		return 1;
	}
	// �����֤�뱨��
	std::cout << "===== TEST REPORT =====" << std::endl;
	std::cout << "Predict dbp:" << std::fixed << result << std::endl;
	std::cout << "Expect result:" << expected_dbp << std::endl;

	if (fabs(result - expected_dbp) < 5) {
		std::cout << "Test passed!" << std::endl;
	} else {
		std::cout << "Test failed!" << std::endl;
	}
}
