# Trabalho-3-SD
Repositório para armazenar HDL para o terceiro trabalho de Sistemas Digitais

# lógica

## Módulo do deserializador (Este módulo deverá funcionar a 100KH). 
  O deserializador deve receber apenas 1 bit pelo data_in. 
  Se o sinal write_in estiver alto:
    o bit recebido é guardado. 
  Quando houver 8 bits guardados:
    data_ready deverá estar alto;
    bits guardados deverão aparecer em data_out.
  
  Os valores de data_out e data_ready deverão se manter os mesmos até:
    que o sinal ack_in fique alto.
  
  Enquanto o deserializador não conseguir enviar os dados:
    deverá manter o sinal de status_out alto (está ocupado) 

### data_in:
  data_in é um sinal que é lido e adicionado a fila do deserializador, adicionado 0 ou 1 de um em um, ate completar 8

### write_in: 
  write_in é o sinal que determina se o deserializador le ou não o sinal do data_in para escrita

### reset:
  É um reset, limpa todo  o deserializador

### Clock:
  É o clock, que neste projeto opera em uma velocidade superioro ao do modulo da fila

### ack_in
  Possívelmente lê o len_out do modulo da FILA, caso len(tamanho da fila no modulo for 0) significa que pode receber, ou seja, o ack vai estar em 1

### status_out
  Sinal de saida que indica se o deserializador pode receber dados ou não

### data_out:
  data_out é o vetor de 8 bits que vai do deserializador para o FILA, quando permitido

### data_ready:
  Sinal que fica alto quando o vector estiver com 8 bits
