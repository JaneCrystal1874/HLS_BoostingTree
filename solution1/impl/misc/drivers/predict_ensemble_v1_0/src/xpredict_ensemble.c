// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xpredict_ensemble.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPredict_ensemble_CfgInitialize(XPredict_ensemble *InstancePtr, XPredict_ensemble_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_bus_BaseAddress = ConfigPtr->Ctrl_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPredict_ensemble_Start(XPredict_ensemble *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_CTRL) & 0x80;
    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XPredict_ensemble_IsDone(XPredict_ensemble *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XPredict_ensemble_IsIdle(XPredict_ensemble *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XPredict_ensemble_IsReady(XPredict_ensemble *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XPredict_ensemble_EnableAutoRestart(XPredict_ensemble *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_CTRL, 0x80);
}

void XPredict_ensemble_DisableAutoRestart(XPredict_ensemble *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_CTRL, 0);
}

u32 XPredict_ensemble_Get_return(XPredict_ensemble *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_AP_RETURN);
    return Data;
}
void XPredict_ensemble_InterruptGlobalEnable(XPredict_ensemble *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_GIE, 1);
}

void XPredict_ensemble_InterruptGlobalDisable(XPredict_ensemble *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_GIE, 0);
}

void XPredict_ensemble_InterruptEnable(XPredict_ensemble *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_IER);
    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_IER, Register | Mask);
}

void XPredict_ensemble_InterruptDisable(XPredict_ensemble *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_IER);
    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_IER, Register & (~Mask));
}

void XPredict_ensemble_InterruptClear(XPredict_ensemble *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPredict_ensemble_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_ISR, Mask);
}

u32 XPredict_ensemble_InterruptGetEnabled(XPredict_ensemble *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_IER);
}

u32 XPredict_ensemble_InterruptGetStatus(XPredict_ensemble *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPredict_ensemble_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPREDICT_ENSEMBLE_CTRL_BUS_ADDR_ISR);
}

