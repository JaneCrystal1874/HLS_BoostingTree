#include "ap_fixed.h"
#include "hls_math.h"
#include "Tree_Param.hpp"

#define FEATURE_SIZE 13 // 特征数量
#define N_TREES 64 // 树数量


//并行多棵树的预测
float predict_ensemble(const float features[FEATURE_SIZE]) {
	#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS
    #pragma HLS ARRAY_PARTITION variable=trees complete dim=1 // 并行化树访问


    float sum = 0;
   // int flag = 0;
    for (int i = 0; i < N_TREES; i++) { // N_TREES=树的数量
        #pragma HLS UNROLL // 完全展开并行预测
        int current_addr = 0;
        TreeNode node;
        while (true) {
            node = LBoostTree[i][current_addr];
//            if (current_addr >= MAX_NODE)
//            {
//                    printf("错误：树%d中的节点地址越界！\n", i);
//                    flag = 1;
//                    break;
//            }
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
//    if(flag == 0)
//    {
//    	printf("无越界情况\n");
//    }
    return sum; // 回归任务输出
}
