# Trabalho 3 de Sistemas Digitais: Múltiplos Domínios de Relógio

# 💡 Módulos

1. TOP (1 MHz)
2. Deserializador (100 KHz)
3. Fila (10 KHz)
---
## ⛏️ Deserializador (100 KHz)

O módulo deserializador recebe dados bit a bit através do sinal data_in. Quando o sinal write_in está alto, o bit presente em data_in é armazenado internamente. Após oito bits, os dados são agrupados e disponibilizados em data_out, com o sinal data_ready sendo ativado para indicar que os dados estão prontos.

Enquanto os dados não forem reconhecidos como recebidos (via ack_in), tanto data_ready quanto data_out permanecem inalterados. Enquanto o módulo está aguardando o envio dos 8 bits agrupados, o sinal status_out estará ativo para indicar que está ocupado e não pode receber mais dados.

# Entradas:
data_in (1 bit): Entrada serial de dados, recebida bit a bit.

write_in (1 bit): Habilita a escrita do bit atual em data_in.

ack_in (1 bit): Indica que o próximo módulo (Fila) pode receber os dados (derivado de len_out da Fila).

# Saídas:
data_out (8 bits): Saída dos dados agrupados.

data_ready (1 bit): Indica que data_out contém dados e prontos para serem lidos.

status_out (1 bit): Indica que o deserializador está ocupado e não pode receber mais dados.

---

## 👥 Fila (10 KHz)

A fila possui 8 posições fixas, cada uma com 8 bits (total de 8 bytes). Ela funciona como uma estrutura FIFO (First-In, First-Out), permitindo que dados sejam inseridos de uma ponta e removidos da outra.
Para inserir um dado, ele deve estar presente no sinal data_in e o sinal enqueue_in deve estar alto. Para remover um dado, o sinal dequeue_in deve ser ativado. No ciclo seguinte, o dado removido aparecerá em data_out.
 
# Entradas:
data_in (8 bits): Dados a serem inseridos na fila.

enqueue_in (1 bit): Sinal para inserir dados na fila.

dequeue_in (1 bit): Sinal para remover dados da fila.


# Saídas:

data_out (8 bits): Dados removidos da fila.

len_out (8 bits): Indica o número de posições atualmente ocupadas na fila.

## 🔝 TOP (1 MHz)

O módulo TOP é responsável por integrar os módulos `deserializador` e `fila`. Ele recebe um clock de 1 MHz e, por meio de outro módulo, gera dois novos sinais de clock:

- 100 KHz para o deserializador
- 10 KHz para a fila
No módulo TOP também ocorre a transformação do sinal len_out em ack_in.
