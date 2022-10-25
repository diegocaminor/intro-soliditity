// SPDX-License-Identifier: GPL-3.0

// - **send**: Envía un monto a una dirección y retorna false si la transferencia no se realiza
// - **transfer**: Envía un monto y revierte si no se puede realizar
// - **call**: Esta es más complicada, pero básicamente realiza una llamada hacia una dirección. Incluso se pueden llamar funciones de otro contrato si se le pasa un address válido y la llamada dentro del parámetro `data`. No obstante, al ser un mensaje, puede llevar ether, y por eso se usa para envíos. Retorna el resultado de la función llamada (si es que fué el caso)

pragma solidity >=0.7.0 <0.9.0;

contract Transferencia {
    
    constructor() payable {
        
    }
    
    function transferenciaPorSend(address destino, uint monto) public returns(bool) {
        bool salida = payable(destino).send(monto);
        return salida;
    }
    
    function transferenciaPorTransfer(address destino, uint monto) public {
        payable(destino).transfer(monto);
    }
    
    function transferenciaPorCall(address destino, uint monto) public returns (bool) {
        (bool salida, bytes memory respuesta) = destino.call{value:monto, gas: 1000}("");
        return salida;
    }
}