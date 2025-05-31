<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Este proyecto es un sistema de cerradura digital por PIN, implementado con una máquina de estados finitos (FSM) que combina los enfoques Moore y Mealy en Verilog. El usuario debe ingresar el código de 4 dígitos 9979, un dígito a la vez.

La FSM tipo Moore controla la progresión de los estados (IDLE → S1 → S2 → S3 → OK).

La lógica tipo Mealy verifica en cada transición si el dígito ingresado es el esperado.

Si todos los dígitos son correctos, el sistema llega al estado OK y se activa la salida unlocked (LED encendido).
Si se ingresa un dígito incorrecto en cualquier momento, el sistema pasa al estado FAIL y permanece bloqueado hasta que se reinicie.

## How to test

Pulsa el botón Reset para iniciar el sistema (estado IDLE).

Usa los 4 interruptores para ingresar el primer dígito: 9 (binario 1001) y luego pulsa Enter.

Repite el proceso para los siguientes dígitos:

Segundo dígito: 9

Tercer dígito: 7 (binario 0111)

Cuarto dígito: 9

Si todos los dígitos fueron ingresados correctamente, el LED de desbloqueo se encenderá.

Si en cualquier paso se ingresa un dígito incorrecto, el sistema cambiará al estado FAIL y quedará bloqueado (el LED permanecerá apagado) hasta que se reinicie con el botón Reset.

## External hardware

Este proyecto utiliza los siguientes componentes virtuales disponibles en el simulador Wokwi:

Componente	Función
4 x Interruptores	Para ingresar cada dígito de 4 bits (digit[3:0])
1 x Botón de pulso	Señal de Enter para confirmar cada dígito
1 x Botón de pulso	Señal de Reset para reiniciar el sistema
1 x LED	Se enciende cuando el PIN es correcto (unlocked)
1 x Fuente de reloj	Genera las transiciones de la FSM
