#include "ap_fixed.h"
#include "hls_math.h"
#include "hls_stream.h"
#include "ap_axi_sdata.h"
#include "Tree_Param.hpp"

#define FEATURE_SIZE 13 // 特征数量
#define N_TREES 64 // 树数量

void predict_ensemble(hls::stream<float>& feature_stream,
		hls::stream<ap_axis<32,0,0,0> >& prediction_stream) {
#pragma HLS INTERFACE axis register port=prediction_stream
#pragma HLS INTERFACE axis register port=feature_stream
#pragma HLS ARRAY_PARTITION variable=LBoostTree block factor=4 dim=1
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS



	float features[FEATURE_SIZE];
#pragma HLS ARRAY_PARTITION variable=features complete dim=1
	Feature_Load:for(int i = 0; i < FEATURE_SIZE; i++)
	{
		features[i] = feature_stream.read();
	}


	float sum = 0;
	Tree_Tranversal:for (int i = 0; i < N_TREES; i++) {
        int current_addr = 0;
        TreeNode node;
        LOOP_TREE_DEPTH:for(int depth = 0; depth < MAX_NODE; depth++) {
#pragma HLS PIPELINE
            node = LBoostTree[i][current_addr];
            if (node.is_leaf) {
            	sum += node.value;
                break;
            }
            //下面执行的不是叶节点，结点值为分裂阈值
            float fval = features[node.feature_index-1];
            current_addr = (fval <= node.value) ?
                          node.left_child : node.right_child;
        }
    }

	prediction_stream.write(sum);
}
