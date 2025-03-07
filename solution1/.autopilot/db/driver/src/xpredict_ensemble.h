// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XPREDICT_ENSEMBLE_H
#define XPREDICT_ENSEMBLE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpredict_ensemble_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Ctrl_bus_BaseAddress;
} XPredict_ensemble_Config;
#endif

typedef struct {
    u32 Ctrl_bus_BaseAddress;
    u32 IsReady;
} XPredict_ensemble;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPredict_ensemble_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPredict_ensemble_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPredict_ensemble_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPredict_ensemble_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XPredict_ensemble_Initialize(XPredict_ensemble *InstancePtr, u16 DeviceId);
XPredict_ensemble_Config* XPredict_ensemble_LookupConfig(u16 DeviceId);
int XPredict_ensemble_CfgInitialize(XPredict_ensemble *InstancePtr, XPredict_ensemble_Config *ConfigPtr);
#else
int XPredict_ensemble_Initialize(XPredict_ensemble *InstancePtr, const char* InstanceName);
int XPredict_ensemble_Release(XPredict_ensemble *InstancePtr);
#endif

void XPredict_ensemble_Start(XPredict_ensemble *InstancePtr);
u32 XPredict_ensemble_IsDone(XPredict_ensemble *InstancePtr);
u32 XPredict_ensemble_IsIdle(XPredict_ensemble *InstancePtr);
u32 XPredict_ensemble_IsReady(XPredict_ensemble *InstancePtr);
void XPredict_ensemble_EnableAutoRestart(XPredict_ensemble *InstancePtr);
void XPredict_ensemble_DisableAutoRestart(XPredict_ensemble *InstancePtr);
u32 XPredict_ensemble_Get_return(XPredict_ensemble *InstancePtr);


void XPredict_ensemble_InterruptGlobalEnable(XPredict_ensemble *InstancePtr);
void XPredict_ensemble_InterruptGlobalDisable(XPredict_ensemble *InstancePtr);
void XPredict_ensemble_InterruptEnable(XPredict_ensemble *InstancePtr, u32 Mask);
void XPredict_ensemble_InterruptDisable(XPredict_ensemble *InstancePtr, u32 Mask);
void XPredict_ensemble_InterruptClear(XPredict_ensemble *InstancePtr, u32 Mask);
u32 XPredict_ensemble_InterruptGetEnabled(XPredict_ensemble *InstancePtr);
u32 XPredict_ensemble_InterruptGetStatus(XPredict_ensemble *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
