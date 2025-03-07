#include "ap_fixed.h"
#include "hls_math.h"
#include "Tree_Param.hpp"

#define FEATURE_SIZE 13 // 特征数量
#define N_TREES 64 // 树数量


//并行多棵树的预测
float predict_ensemble(const float features[FEATURE_SIZE]) {
	#pragma HLS ARRAY_PARTITION variable=LBoostTree block factor=4 dim=1
	#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS

   float sum = 0;
   // int flag = 0;
    for (int i = 0; i < N_TREES; i++) {
#pragma HLS PIPELINE II=1
 // N_TREES=树的数量
       // #pragma HLS UNROLL // 完全展开并行预测
        int current_addr = 0;
        TreeNode node;
        while (true) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=20 avg=10 // 添加人工循环分析指导
            node = LBoostTree[i][current_addr];
            if (node.is_leaf) {
                sum += node.value;
                break;
            }
            //下面执行的不是叶节点，结点值为分裂阈值
            float fval = features[node.feature_index-1];//注意此处跟matlab平台的索引有错位！
            current_addr = (fval <= node.value) ?
                          node.left_child : node.right_child;
        }
    }
    return sum; // 回归任务输出
}
