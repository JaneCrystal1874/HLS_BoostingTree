// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xpredict_ensemble.h"

extern XPredict_ensemble_Config XPredict_ensemble_ConfigTable[];

XPredict_ensemble_Config *XPredict_ensemble_LookupConfig(u16 DeviceId) {
	XPredict_ensemble_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPREDICT_ENSEMBLE_NUM_INSTANCES; Index++) {
		if (XPredict_ensemble_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XPredict_ensemble_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPredict_ensemble_Initialize(XPredict_ensemble *InstancePtr, u16 DeviceId) {
	XPredict_ensemble_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPredict_ensemble_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPredict_ensemble_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

