set moduleName predict_ensemble
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {predict_ensemble}
set C_modelType { void 0 }
set C_modelArgList {
	{ feature_stream_V float 32 regular {axi_s 0 volatile  { feature_stream_V Data } }  }
	{ prediction_sbp_V float 32 regular {axi_s 1 volatile  { prediction_sbp_V Data } }  }
	{ prediction_dbp_V float 32 regular {axi_s 1 volatile  { prediction_dbp_V Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "feature_stream_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "feature_stream.V","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "prediction_sbp_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "prediction_sbp.V","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "prediction_dbp_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "prediction_dbp.V","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ feature_stream_V_TDATA sc_in sc_lv 32 signal 0 } 
	{ feature_stream_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ feature_stream_V_TREADY sc_out sc_logic 1 inacc 0 } 
	{ prediction_sbp_V_TDATA sc_out sc_lv 32 signal 1 } 
	{ prediction_sbp_V_TVALID sc_out sc_logic 1 outvld 1 } 
	{ prediction_sbp_V_TREADY sc_in sc_logic 1 outacc 1 } 
	{ prediction_dbp_V_TDATA sc_out sc_lv 32 signal 2 } 
	{ prediction_dbp_V_TVALID sc_out sc_logic 1 outvld 2 } 
	{ prediction_dbp_V_TREADY sc_in sc_logic 1 outacc 2 } 
	{ s_axi_CTRL_BUS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_BUS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CTRL_BUS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_BUS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_BUS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CTRL_BUS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CTRL_BUS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CTRL_BUS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "AWADDR" },"address":[{"name":"predict_ensemble","role":"start","value":"0","valid_bit":"0"},{"name":"predict_ensemble","role":"continue","value":"0","valid_bit":"4"},{"name":"predict_ensemble","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CTRL_BUS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "AWVALID" } },
	{ "name": "s_axi_CTRL_BUS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "AWREADY" } },
	{ "name": "s_axi_CTRL_BUS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WVALID" } },
	{ "name": "s_axi_CTRL_BUS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WREADY" } },
	{ "name": "s_axi_CTRL_BUS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WDATA" } },
	{ "name": "s_axi_CTRL_BUS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WSTRB" } },
	{ "name": "s_axi_CTRL_BUS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "ARADDR" },"address":[{"name":"predict_ensemble","role":"start","value":"0","valid_bit":"0"},{"name":"predict_ensemble","role":"done","value":"0","valid_bit":"1"},{"name":"predict_ensemble","role":"idle","value":"0","valid_bit":"2"},{"name":"predict_ensemble","role":"ready","value":"0","valid_bit":"3"},{"name":"predict_ensemble","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CTRL_BUS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "ARVALID" } },
	{ "name": "s_axi_CTRL_BUS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "ARREADY" } },
	{ "name": "s_axi_CTRL_BUS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RVALID" } },
	{ "name": "s_axi_CTRL_BUS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RREADY" } },
	{ "name": "s_axi_CTRL_BUS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RDATA" } },
	{ "name": "s_axi_CTRL_BUS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RRESP" } },
	{ "name": "s_axi_CTRL_BUS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "BVALID" } },
	{ "name": "s_axi_CTRL_BUS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "BREADY" } },
	{ "name": "s_axi_CTRL_BUS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "feature_stream_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feature_stream_V", "role": "TDATA" }} , 
 	{ "name": "feature_stream_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "feature_stream_V", "role": "TVALID" }} , 
 	{ "name": "feature_stream_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "feature_stream_V", "role": "TREADY" }} , 
 	{ "name": "prediction_sbp_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "prediction_sbp_V", "role": "TDATA" }} , 
 	{ "name": "prediction_sbp_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "prediction_sbp_V", "role": "TVALID" }} , 
 	{ "name": "prediction_sbp_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "prediction_sbp_V", "role": "TREADY" }} , 
 	{ "name": "prediction_dbp_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "prediction_dbp_V", "role": "TDATA" }} , 
 	{ "name": "prediction_dbp_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "prediction_dbp_V", "role": "TVALID" }} , 
 	{ "name": "prediction_dbp_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "prediction_dbp_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55"],
		"CDFG" : "predict_ensemble",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1160", "EstimateLatencyMax" : "13448",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "feature_stream_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "feature_stream_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "prediction_sbp_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "prediction_sbp_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "prediction_dbp_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "prediction_dbp_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "LBoostTree1_is_leaf_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_is_leaf_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_is_leaf_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_is_leaf_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_feature_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_feature_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_feature_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_feature_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_value_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_value_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_value_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_left_chi_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_left_chi_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_left_chi_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_left_chi", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_right_ch_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_right_ch_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_right_ch_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree1_right_ch", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_is_leaf_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_is_leaf_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_is_leaf_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_is_leaf_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_feature_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_feature_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_feature_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_feature_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_value_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_value_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_value_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_left_chi_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_left_chi_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_left_chi_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_left_chi", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_right_ch_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_right_ch_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_right_ch_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LBoostTree2_right_ch", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_is_leaf_s_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_is_leaf_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_is_leaf_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_is_leaf_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_feature_3_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_feature_2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_feature_1_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_feature_s_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_value_0_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_value_1_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_value_2_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_value_3_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_left_chi_3_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_left_chi_2_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_left_chi_1_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_left_chi_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_right_ch_3_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_right_ch_2_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_right_ch_1_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree1_right_ch_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_is_leaf_s_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_is_leaf_1_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_is_leaf_2_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_is_leaf_3_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_feature_3_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_feature_2_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_feature_1_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_feature_s_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_value_0_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_value_1_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_value_2_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_value_3_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_left_chi_3_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_left_chi_2_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_left_chi_1_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_left_chi_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_right_ch_3_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_right_ch_2_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_right_ch_1_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LBoostTree2_right_ch_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_CTRL_BUS_s_axi_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_PgM_U1", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_QgW_U2", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_Rg6_U3", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_Shg_U4", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_Thq_U5", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_UhA_U6", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_UhA_U7", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_VhK_U8", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_Rg6_U9", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_Shg_U10", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_Thq_U11", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_UhA_U12", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_UhA_U13", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.predict_ensemble_VhK_U14", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	predict_ensemble {
		feature_stream_V {Type I LastRead 1 FirstWrite -1}
		prediction_sbp_V {Type O LastRead -1 FirstWrite 3}
		prediction_dbp_V {Type O LastRead -1 FirstWrite 3}
		LBoostTree1_is_leaf_s {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_is_leaf_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_is_leaf_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_is_leaf_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_feature_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_feature_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_feature_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_feature_s {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_value_0 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_value_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_value_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_value_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_left_chi_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_left_chi_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_left_chi_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_left_chi {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_right_ch_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_right_ch_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_right_ch_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree1_right_ch {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_is_leaf_s {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_is_leaf_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_is_leaf_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_is_leaf_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_feature_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_feature_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_feature_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_feature_s {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_value_0 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_value_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_value_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_value_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_left_chi_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_left_chi_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_left_chi_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_left_chi {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_right_ch_3 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_right_ch_2 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_right_ch_1 {Type I LastRead -1 FirstWrite -1}
		LBoostTree2_right_ch {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1160", "Max" : "13448"}
	, {"Name" : "Interval", "Min" : "1161", "Max" : "13449"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	feature_stream_V { axis {  { feature_stream_V_TDATA in_data 0 32 }  { feature_stream_V_TVALID in_vld 0 1 }  { feature_stream_V_TREADY in_acc 1 1 } } }
	prediction_sbp_V { axis {  { prediction_sbp_V_TDATA out_data 1 32 }  { prediction_sbp_V_TVALID out_vld 1 1 }  { prediction_sbp_V_TREADY out_acc 0 1 } } }
	prediction_dbp_V { axis {  { prediction_dbp_V_TDATA out_data 1 32 }  { prediction_dbp_V_TVALID out_vld 1 1 }  { prediction_dbp_V_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
