# Grades-Recovery-Section

### Um código que converte qualquer valor na entrada para inteiro.<br>

<br>**Funcionamento:**<br>
 - Entrada: setada no início do código.<br>
 - Converte a string para inteiro, seções separadas para positivo e negativo.<br>
 - Variável ```isCastValid```:
     * Se o resultado for 0: estouro nos limites de representação.
     * Se o resultado for 1: o resultado comporta os limites de representação.<br>

<br>**Sobre o código:**<br>
- Sintaxe Intel x64_86<br>
- Não há verificações de entrada<br>
- Conversão gravada na variável ```resultado```
 <br>
 
**Para montar e ligar use os seguintes comandos:**
 ```
nasm -f elf64 HeloisaAlves.LMRAV01.asm
ld HeloisaAlves.LMRAV01.o -o HeloisaAlves.LMRAV01.x
 ```
 
 **O código não apresenta mensagens para o usuário, as verificações são feitas por debugação no GDB:**
 ```
gdb -q HeloisaAlves.LMRAV01.x
b fim
r
 ```
 
 **Para verificar o valor do resultado:**
  ```
  x/gd &resultado
  ```
 
 **Para verificar o valor de isCastValid:**
  ```
  x/1b &isCastValid
   ```
 
