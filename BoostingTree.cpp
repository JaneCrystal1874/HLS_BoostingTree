#include "Tree_Param.hpp"
#include "ap_fixed.h"
#include "hls_math.h"
#include "hls_stream.h"
#include "ap_axi_sdata.h"


#define FEATURE_SIZE 4 // 特征数量
#define N_TREES 64 // 树数量

void predict_ensemble(hls::stream<float>& feature_stream,
		hls::stream<float>& prediction_sbp,
		hls::stream<float>& prediction_dbp) {
#pragma HLS INTERFACE axis register port=prediction_sbp
#pragma HLS INTERFACE axis register port=prediction_dbp
#pragma HLS INTERFACE axis register port=feature_stream
#pragma HLS ARRAY_PARTITION variable=LBoostTree1 block factor=4 dim=1
#pragma HLS ARRAY_PARTITION variable=LBoostTree2 block factor=4 dim=1
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS

	float features[FEATURE_SIZE];
#pragma HLS ARRAY_PARTITION variable=features complete dim=1
	Feature_Load:for(int i = 0; i < FEATURE_SIZE; i++)
	{
		features[i] = feature_stream.read();
	}


	float sbp = 0;
	float dbp = 0;

	Tree_Tranversal:for (int i = 0; i < N_TREES; i++) {
        int current_addr1 = 0;
        TreeNode node1;

        LOOP_TREE_DEPTH:for(int depth = 0; depth < MAX_NODE; depth++) {
#pragma HLS PIPELINE
            node1 = LBoostTree1[i][current_addr1];

            if (node1.is_leaf) {
            	sbp += node1.value;
                break;
            }
            //下面执行的不是叶节点，结点值为分裂阈值
            float fval1 = features[node1.feature_index-1];
            current_addr1 = (fval1 <= node1.value) ?
                          node1.left_child : node1.right_child;
        }
    }

	Tree_Tranversal2:for (int i = 0; i < N_TREES; i++) {
		int current_addr = 0;
		TreeNode node;
		LOOP_TREE_DEPTH2:for(int depth = 0; depth < MAX_NODE; depth++) {
#pragma HLS PIPELINE
			node = LBoostTree2[i][current_addr];
			if (node.is_leaf) {
				dbp += node.value;
				break;
			}
			//下面执行的不是叶节点，结点值为分裂阈值
			float fval = features[node.feature_index-1];
			current_addr = (fval <= node.value) ?
						  node.left_child : node.right_child;
		}
	}
	prediction_sbp.write(sbp);
	prediction_dbp.write(dbp);
}
