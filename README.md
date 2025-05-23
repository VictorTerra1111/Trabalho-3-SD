# Trabalho-3-SD
Repositório para armazenar HDL para o terceiro trabalho de Sistemas Digitais

# lógica

## Módulo do deserializador 

  input data_in, write_in, reset, clock, ack_in
  output status_out, data_out, data_ready

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
