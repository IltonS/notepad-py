# Notepad Py

### Resumo
O Notepad Py é um editor de código fonte para a linguagem Python. Sua interface minimalista permite realizar operações básicas de edição de texto de maneira mais rápida e fácil, o que o torna adequado para edição de pequenos scripts e/ou para usuários que estejam aprendendo a linguagem.

### Introdução
Este projeto foi feito como uma complementação dos meus estudos nas linguagens Delphi e Python. A criação de um editor de código fonte em delphi permite exercitar conceitos do uso da VCL, o uso de lógica de programação no desenvolvimento de funcionalidades como as de Localizar e Substituir, e explorar e entender componentes de terceiros com o uso do SynEdit. Como esse projeto também envolve meu primeiro contato com a linguagem Pyhton, alguns scripts de exemplo (editados no Notepad Py) foram incluídos na release. São 2 scripts simples que implementam alguns cálculos geométricos, um gerador de números primos, que na verdade é uma tradução de um exemplo clássico da linguagem Pascal, e uma implementação do Jogo da velha.

### Pré-requisitos
O Notepad Py não requer instalação, basta abrir o arquivo executável. Porém, para que o comando _Rodar_ funcione corretamente, é necessário ter o interpretador do Python instalado e configurado na máquina, ou seja, se o comando `py` puder ser executado no terminal do Windows, o recurso _Rodar_ no Notepad Py também irá funcionar corretamente.

### Ajuda do programa
Este projeto também possui um [Wiki](https://github.com/IltonS/notepad-py/wiki) com ajuda para as principais funcionalidades do programa. É possível acessar esse wiki no Notepad Py através do atalho `Ctrl+F1`. Também é possível acessar a documentação oficial do Python através do atalho `F1`.

### Scripts incluídos

#### Calculadora de Pirâmides
Script que realiza alguns cálculos geométricos para uma pirâmide de base retangular. Estre script utiliza o paradigma de programação orientado a objetos. Os cálculos sâo:
* Altura
* Área da base
* Área da superfície
* Comprimento da base
* Largura da base
* Superfície lateral
* Volume

#### Número piramidal quadrado
Este script determina se um número N digitado pelo usuário é um número piramidal quadrado. Ou seja, se com este número N é possível formar uma pirâmide quadrangular. Este script utiliza um paradigma de programação procedural.

#### Gerador de números primos
Script que gera todos os números primos entre 0 e 100

#### Jogo da velha
Implementação do jogo clássico. Possui modos para 1 e 2 jogadores. No modo para 1 jogador, o script não implementa nenhum tipo de inteligência e as jogadas da máquina são feitas de maneira aleatória. No modo para 2 jogadores, a leitura da jogada é feita em turnos, permitindo que duas pessoas alternem a entrada de dados.
