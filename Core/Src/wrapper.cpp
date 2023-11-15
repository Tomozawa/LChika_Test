/*
 * wrapper.cpp
 *
 *  Created on: 2023/11/08
 *      Author: yudun
 */

#include "wrapper.h"
#include "main.h"
#include "CRSLibtmp/Can/Stm32/RM0008/can_bus.hpp"

using namespace CRSLib;
using namespace CRSLib::IntegerTypes;
using namespace CRSLib::Can;
using namespace CRSLib::Can::Stm32::RM0008;

struct EncoderValues{
	u16 encoder_1; //on TIM2
	u16 encoder_2; //on TIM3
	u16 encoder_3; //on TIM4
};

inline void init_encoder(TIM_HandleTypeDef&);
inline bool post_u16(unsigned long, u16, CanBus&);
inline unsigned char is_mailbox_full(void);

volatile EncoderValues encoder_values;

extern "C" {
	extern TIM_HandleTypeDef htim2, htim3, htim4;

	void wrapper_cpp(void){
		CanBus can_bus = CanBus{can1};

		init_encoder(htim2);
		init_encoder(htim3);
		init_encoder(htim4);

		while(1){
			encoder_values.encoder_1 = htim2.Instance->CNT;
			encoder_values.encoder_2 = htim3.Instance->CNT;
			encoder_values.encoder_3 = htim4.Instance->CNT;

			post_u16(0x100, encoder_values.encoder_1, can_bus);
		}
	}
}

void init_encoder(TIM_HandleTypeDef& htim){
	htim.Instance->CCER |= TIM_CCER_CC1E | TIM_CCER_CC2E;
	htim.Instance->CR1 |= TIM_CR1_CEN;
}

bool post_u16(unsigned long id, u16 payload, CanBus& can_bus){
	DataField data_field;

	std::memcpy(data_field.buffer, &payload, sizeof(payload));
	data_field.dlc = sizeof(payload);

	return can_bus.post(id, data_field);
}

unsigned char is_mailbox_full(void){
	return (can1->RFxR[0] | CAN_RF0R_FULL0) != 0;
}
