# Rasp Ducky

## Introdução

O Rasp Ducky é um projeto baseado no conceito do Rubber Ducky, uma ferramenta de pentest que simula HID, executando uma programação de um payload. Esta versão utiliza um Raspberry Pi e permite a execução de payloads personalizados para automatizar ações.

## Estrutura do Projeto

- **ducky.sh:** O script principal que contém os payloads e a lógica de execução.
- **payload.dd:** Arquivo que armazena o código a ser executado.

## Requisitos

- Raspberry Pi Zero 2W.
- Cartão microSD.
- Sistema operacional instalado no Raspberry Pi (Raspbian recomendado).

## Execução do Rasp Ducky

1. **Adicionar Payloads:**
- Adicione a programação do Rasp no payload.dd, conforme as teclas disponíveis.

2. **Executar o Rasp Ducky:**
- Conectar o pino de dados e alimentação a um usb da máquina alvo.
- Execute o ducky.sh.

<br/>
<details>

<summary>Teclas Disponíveis</summary>

##### ctrl+T (para alterar basta entrar no bash e alterar a 2° tecla do ctrl) 
##### shift
##### alt
##### esc
##### \
##### /
##### =
##### _
##### "
##### {
##### }
##### win (win+r)
##### tab
##### enter
##### spc (space)
##### volumeup
##### volumedown
##### hold(evita o release padrão da tecla, deve ser colocado antes da tecla a ser segurada)
##### up (arrowUp)
##### down
##### left
##### right
##### -(hífen)
##### .(dot)
##### alfabeto
##### números
##### delay: escrever "delay " e adicionar um float ou íntegro

</details>

