<p align="center"><b>Progresso da tradução:</b> 60% - Falta traduzir os manuscript</p>

<br>

<p align="center"><img src="https://raw.githubusercontent.com/odb/official-bash-logo/master/assets/Logos/Icons/PNG/512x512.png" width="200px"></p>
<h1 align="center">pure bash bible</h1> <p
align="center">Uma coleção de alternativas em bash puro para processos externos.</p>

<p align="center">
<a href="./LICENSE.md"><img
src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

<br>

<a href="https://leanpub.com/bash/">
<img src="https://s3.amazonaws.com/titlepages.leanpub.com/bash/hero" width="40%" align="right">
</a>

O objetivo deste livro é documentar métodos comumente conhecidos e menos conhecidos de realizar várias tarefas usando apenas recursos nativos (built-in) do `bash`. Usar os trechos (snippets) desta bíblia pode ajudar a remover dependências desnecessárias de scripts e, na maioria dos casos, torná-los mais rápidos. Encontrei essas dicas e descobri algumas enquanto desenvolvia o [neofetch](https://github.com/dylanaraps/neofetch), [pxltrm](https://github.com/dylanaraps/pxltrm) e outros projetos menores.

Os trechos abaixo são verificados usando o `shellcheck` e testes foram escritos onde aplicável. Quer contribuir? Leia o [CONTRIBUTING.md](https://github.com/dylanaraps/pure-bash-bible/blob/master/CONTRIBUTING.md). Ele descreve como os testes unitários funcionam e o que é necessário ao adicionar trechos à bíblia.

Viu algo descrito incorretamente, com bugs ou totalmente errado? Abra uma issue ou envie um pull request. Se a bíblia estiver faltando algo, abra uma issue e uma solução será encontrada.

<br>
<p align="center"><b>Este livro também está disponível para compra no leanpub. https://leanpub.com/bash</b></p>
<p align="center"><b>Ou você pode me pagar um café.</b>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=V7QNJNKS3WYVS"><img src="https://img.shields.io/badge/don-paypal-yellow.svg"></a> <a href="https://www.patreon.com/dyla"><img src="https://img.shields.io/badge/don-patreon-yellow.svg"> </a><a href="https://liberapay.com/2211/"><img src="https://img.shields.io/badge/don-liberapay-yellow.svg"></a>
</p>

<br>

# Índice

<!-- vim-markdown-toc GFM -->

* [PREFÁCIO](#foreword)
* [STRINGS](#strings)
    * [Remover espaços em branco do início e fim da string](#trim-leading-and-trailing-white-space-from-string)
    * [Remover todos os espaços em branco da string e truncar espaços](#trim-all-white-space-from-string-and-truncate-spaces)
    * [Usar regex em uma string](#use-regex-on-a-string)
    * [Dividir uma string em um delimitador](#split-a-string-on-a-delimiter)
    * [Alterar uma string para minúsculas](#change-a-string-to-lowercase)
    * [Alterar uma string para maiúsculas](#change-a-string-to-uppercase)
    * [Inverter a caixa de uma string](#reverse-a-string-case)
    * [Remover aspas de uma string](#trim-quotes-from-a-string)
    * [Remover todas as instâncias de um padrão da string](#strip-all-instances-of-pattern-from-string)
    * [Remover a primeira ocorrência de um padrão da string](#strip-first-occurrence-of-pattern-from-string)
    * [Remover padrão do início da string](#strip-pattern-from-start-of-string)
    * [Remover padrão do final da string](#strip-pattern-from-end-of-string)
    * [Codificar uma string em percent-encode (URL)](#percent-encode-a-string)
    * [Decodificar uma string percent-encoded](#decode-a-percent-encoded-string)
    * [Verificar se a string contém uma substring](#check-if-string-contains-a-sub-string)
    * [Verificar se a string começa com uma substring](#check-if-string-starts-with-sub-string)
    * [Verificar se a string termina com uma substring](#check-if-string-ends-with-sub-string)
* [ARRAYS](#arrays)
    * [Inverter um array](#reverse-an-array)
    * [Remover elementos duplicados do array](#remove-duplicate-array-elements)
    * [Elemento aleatório do array](#random-array-element)
    * [Ciclar através de um array](#cycle-through-an-array)
    * [Alternar entre dois valores](#toggle-between-two-values)
* [LOOPS (LAÇOS)](#loops)
    * [Loop sobre um intervalo de números](#loop-over-a-range-of-numbers)
    * [Loop sobre um intervalo variável de números](#loop-over-a-variable-range-of-numbers)
    * [Loop sobre um array](#loop-over-an-array)
    * [Loop sobre um array com índice](#loop-over-an-array-with-an-index)
    * [Loop sobre o conteúdo de um arquivo](#loop-over-the-contents-of-a-file)
    * [Loop sobre arquivos e diretórios](#loop-over-files-and-directories)
* [MANIPULAÇÃO DE ARQUIVOS](#file-handling)
    * [Ler um arquivo para uma string](#read-a-file-to-a-string)
    * [Ler um arquivo para um array (*por linha*)](#read-a-file-to-an-array-by-line)
    * [Obter as primeiras N linhas de um arquivo](#get-the-first-n-lines-of-a-file)
    * [Obter as últimas N linhas de um arquivo](#get-the-last-n-lines-of-a-file)
    * [Obter o número de linhas em um arquivo](#get-the-number-of-lines-in-a-file)
    * [Contar arquivos ou diretórios em um diretório](#count-files-or-directories-in-directory)
    * [Criar um arquivo vazio](#create-an-empty-file)
    * [Extrair linhas entre dois marcadores](#extract-lines-between-two-markers)
* [CAMINHOS DE ARQUIVO](#file-paths)
    * [Obter o nome do diretório de um caminho de arquivo](#get-the-directory-name-of-a-file-path)
    * [Obter o nome base de um caminho de arquivo](#get-the-base-name-of-a-file-path)
* [VARIÁVEIS](#variables)
    * [Atribuir e acessar uma variável usando uma variável](#assign-and-access-a-variable-using-a-variable)
    * [Nomear uma variável com base em outra variável](#name-a-variable-based-on-another-variable)
* [SEQUÊNCIAS DE ESCAPE](#escape-sequences)
    * [Cores de Texto](#text-colors)
    * [Atributos de Texto](#text-attributes)
    * [Movimento do Cursor](#cursor-movement)
    * [Apagando Texto](#erasing-text)
* [EXPANSÃO DE PARÂMETROS](#parameter-expansion)
    * [Indireção](#indirection)
    * [Substituição](#replacement)
    * [Comprimento](#length)
    * [Expansão](#expansion)
    * [Modificação de Caixa (Maiúscula/Minúscula)](#case-modification)
    * [Valor Padrão](#default-value)
* [EXPANSÃO DE CHAVES](#brace-expansion)
    * [Intervalos](#ranges)
    * [Listas de Strings](#string-lists)
* [EXPRESSÕES CONDICIONAIS](#conditional-expressions)
    * [Condicionais de Arquivo](#file-conditionals)
    * [Comparações de Arquivo](#file-comparisons)
    * [Condicionais de Variável](#variable-conditionals)
    * [Comparações de Variável](#variable-comparisons)
* [OPERADORES ARITMÉTICOS](#arithmetic-operators)
    * [Atribuição](#assignment)
    * [Aritmética](#arithmetic)
    * [Bitwise (Bit a bit)](#bitwise)
    * [Lógico](#logical)
    * [Diversos](#miscellaneous)
* [ARITMÉTICA](#arithmetic-1)
    * [Sintaxe mais simples para definir variáveis](#simpler-syntax-to-set-variables)
    * [Testes Ternários](#ternary-tests)
* [TRAPS (ARMADILHAS)](#traps)
    * [Fazer algo ao sair do script](#do-something-on-script-exit)
    * [Ignorar interrupção do terminal (CTRL+C, SIGINT)](#ignore-terminal-interrupt-ctrlc-sigint)
    * [Reagir ao redimensionamento da janela](#react-to-window-resize)
    * [Fazer algo antes de cada comando](#do-something-before-every-command)
    * [Fazer algo quando uma função shell ou arquivo carregado terminar de executar](#do-something-when-a-shell-function-or-a-sourced-file-finishes-executing)
* [PERFORMANCE](#performance)
    * [Desativar Unicode](#disable-unicode)
* [SINTAXE OBSOLETA](#obsolete-syntax)
    * [Shebang](#shebang)
    * [Substituição de Comando](#command-substitution)
    * [Declaração de Função](#function-declaration)
* [VARIÁVEIS INTERNAS](#internal-variables)
    * [Obter a localização do binário `bash`](#get-the-location-to-the-bash-binary)
    * [Obter a versão do processo `bash` atual em execução](#get-the-version-of-the-current-running-bash-process)
    * [Abrir o editor de texto preferido do usuário](#open-the-users-preferred-text-editor)
    * [Obter o nome da função atual](#get-the-name-of-the-current-function)
    * [Obter o nome do host (hostname) do sistema](#get-the-host-name-of-the-system)
    * [Obter a arquitetura do Sistema Operacional](#get-the-architecture-of-the-operating-system)
    * [Obter o nome do Sistema Operacional / Kernel](#get-the-name-of-the-operating-system--kernel)
    * [Obter o diretório de trabalho atual](#get-the-current-working-directory)
    * [Obter o número de segundos que o script está rodando](#get-the-number-of-seconds-the-script-has-been-running)
    * [Obter um inteiro pseudoaleatório](#get-a-pseudorandom-integer)
* [INFORMAÇÕES SOBRE O TERMINAL](#information-about-the-terminal)
    * [Obter o tamanho do terminal em linhas e colunas (*de um script*)](#get-the-terminal-size-in-lines-and-columns-from-a-script)
    * [Obter o tamanho do terminal em pixels](#get-the-terminal-size-in-pixels)
    * [Obter a posição atual do cursor](#get-the-current-cursor-position)
* [CONVERSÃO](#conversion)
    * [Converter uma cor hex para RGB](#convert-a-hex-color-to-rgb)
    * [Converter uma cor RGB para hex](#convert-an-rgb-color-to-hex)
* [CODE GOLF](#code-golf)
    * [Sintaxe de loop `for` mais curta](#shorter-for-loop-syntax)
    * [Loops infinitos mais curtos](#shorter-infinite-loops)
    * [Declaração de função mais curta](#shorter-function-declaration)
    * [Sintaxe `if` mais curta](#shorter-if-syntax)
    * [Declaração `case` mais simples para definir variável](#simpler-case-statement-to-set-variable)
* [OUTROS](#other)
    * [Usar `read` como alternativa ao comando `sleep`](#use-read-as-an-alternative-to-the-sleep-command)
    * [Verificar se um programa está no PATH do usuário](#check-if-a-program-is-in-the-users-path)
    * [Obter a data atual usando `strftime`](#get-the-current-date-using-strftime)
    * [Obter o nome de usuário do usuário atual](#get-the-username-of-the-current-user)
    * [Gerar um UUID V4](#generate-a-uuid-v4)
    * [Barras de progresso](#progress-bars)
    * [Obter a lista de funções em um script](#get-the-list-of-functions-in-a-script)
    * [Ignorar aliases do shell](#bypass-shell-aliases)
    * [Ignorar funções do shell](#bypass-shell-functions)
    * [Executar um comando em segundo plano (background)](#run-a-command-in-the-background)
    * [Capturar o retorno de uma função sem substituição de comando](#capture-the-return-value-of-a-function-without-command-substitution)
* [POSFÁCIO](#afterword)

<!-- vim-markdown-toc -->

<br>

<!-- CHAPTER START -->
# PREFÁCIO

Uma coleção de alternativas em `bash` puro para processos e programas externos. A linguagem de script `bash` é mais poderosa do que as pessoas imaginam e a maioria das tarefas pode ser realizada sem depender de programas externos.

Chamar um processo externo no `bash` é custoso e o uso excessivo causará uma lentidão perceptível. Scripts e programas escritos usando métodos nativos (*onde aplicável*) serão mais rápidos, exigirão menos dependências e proporcionarão uma melhor compreensão da própria linguagem.

O conteúdo deste livro fornece uma referência para resolver problemas encontrados ao escrever programas e scripts em `bash`. Os exemplos estão em formatos de função, mostrando como incorporar essas soluções ao código.

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# STRINGS

## Remover espaços em branco do início e fim da string

Esta é uma alternativa ao `sed`, `awk`, `perl` e outras ferramentas. A função abaixo funciona encontrando todos os espaços em branco no início e no fim e removendo-os da string. O comando interno (built-in) `:` é usado no lugar de uma variável temporária.

**Exemplo de Função:**

```sh
trim_string() {
    # Utilização: trim_string "   string de exemplo    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}
```

**Exemplo de Uso:**

```shell
$ trim_string "    Hello,  World    "
Hello,  World

$ name="   John Black  "
$ trim_string "$name"
John Black
```


## Remover todos os espaços em branco da string e truncar espaços

Esta é uma alternativa ao `sed`, `awk`, `perl` e outras ferramentas. A função abaixo funciona abusando da divisão de palavras (word splitting) para criar uma nova string sem espaços iniciais/finais e com espaços truncados (comprimidos).

**Exemplo de Função:**

```sh
# shellcheck disable=SC2086,SC2048
trim_all() {
    # Utilização: trim_all "   string de exemplo    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}
```

**Exemplo de Uso:**

```shell
$ trim_all "    Hello,    World    "
Hello, World

$ name="   John   Black  is     my    name.    "
$ trim_all "$name"
John Black is my name.
```

## Usar regex em uma string

O resultado da correspondência de regex do `bash` pode ser usado para substituir o `sed` em um grande número de casos de uso.

**AVISO**: Este é um dos poucos recursos do `bash` dependentes de plataforma. O `bash` usará qualquer motor de regex instalado no sistema do usuário. Atenha-se aos recursos de regex POSIX se o objetivo for compatibilidade.

**AVISO**: Este exemplo imprime apenas o primeiro grupo correspondente. Ao usar múltiplos grupos de captura, alguma modificação é necessária.

**Exemplo de Função:**

```sh
regex() {
    # Utilização: regex "string" "regex"
    [[ $1 =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[1]}"
}
```

**Exemplo de Uso:**

```shell
$ # Remova os espaços em branco à esquerda.
$ regex '    hello' '^\s*(.*)'
hello

$ # Validar uma cor hexa
$ regex "#FFFFFF" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
#FFFFFF

$ # Validar uma cor hexadecimal (inválida).
$ regex "red" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
# resultado será sem nenhuma saída (inválido)
```

**Exemplo de Uso em script:**

```shell
is_hex_color() {
    if [[ $1 =~ ^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$ ]]; then
        printf '%s\n' "${BASH_REMATCH[1]}"
    else
        printf '%s\n' "error: $1 is an invalid color."
        return 1
    fi
}

read -r color
is_hex_color "$color" || color="#FFFFFF"

# Faça coisas.
```


## Dividir uma string em um delimitador

**AVISO:** Requer `bash` 4+

Esta é uma alternativa ao `cut`, `awk` e outras ferramentas.

**Exemplo de Função:**

```sh
split() {
   # Utilização: split "string" "delimitador"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}
```

**Exemplo de Uso:**

```shell
$ split "apples,oranges,pears,grapes" ","
apples
oranges
pears
grapes

$ split "1, 2, 3, 4, 5" ", "
1
2
3
4
5

# Delimitadores com vários caracteres também funcionam!
$ split "hello---world---my---name---is---john" "---"
hello
world
my
name
is
john
```

## Alterar uma string para minúsculas

**AVISO:** Requer `bash` 4+

**Exemplo de Função:**

```sh
lower() {
    # Utilização: lower "string"
    printf '%s\n' "${1,,}"
}
```

**Exemplo de Uso:**

```shell
$ lower "HELLO"
hello

$ lower "HeLlO"
hello

$ lower "hello"
hello
```

## Alterar uma string para maiúsculas

**AVISO:** Requer `bash` 4+

**Exemplo de Função:**

```sh
upper() {
    # Utilização: upper "string"
    printf '%s\n' "${1^^}"
}
```

**Exemplo de Uso:**

```shell
$ upper "hello"
HELLO

$ upper "HeLlO"
HELLO

$ upper "HELLO"
HELLO
```

## Inverter a caixa de uma string

**AVISO:** Requer `bash` 4+

**Exemplo de Função:**

```sh
reverse_case() {
    # Utilização: reverse_case "string"
    printf '%s\n' "${1~~}"
}
```

**Exemplo de Uso:**

```shell
$ reverse_case "hello"
HELLO

$ reverse_case "HeLlO"
hElLo

$ reverse_case "HELLO"
hello
```

## Remover aspas de uma string

**Exemplo de Função:**

```sh
trim_quotes() {
    # Utilização: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}
```

**Exemplo de Uso:**

```shell
$ var="'Hello', \"World\""
$ trim_quotes "$var"
Hello, World
```

## Remover todas as instâncias de um padrão da string

**Exemplo de Função:**

```sh
strip_all() {
    # Utilização: strip_all "string" "padrão"
    printf '%s\n' "${1//$2}"
}
```

**Exemplo de Uso:**

```shell
$ strip_all "The Quick Brown Fox" "[aeiou]"
Th Qck Brwn Fx

$ strip_all "The Quick Brown Fox" "[[:space:]]"
TheQuickBrownFox

$ strip_all "The Quick Brown Fox" "Quick "
The Brown Fox
```

## Remover a primeira ocorrência de um padrão da string

**Exemplo de Função:**

```sh
strip() {
    # Utilização: strip "string" "padrão"
    printf '%s\n' "${1/$2}"
}
```

**Exemplo de Uso:**

```shell
$ strip "The Quick Brown Fox" "[aeiou]"
Th Quick Brown Fox

$ strip "The Quick Brown Fox" "[[:space:]]"
TheQuick Brown Fox
```

## Remover padrão do início da string

**Exemplo de Função:**

```sh
lstrip() {
    # Utilização: lstrip "string" "padrão"
    printf '%s\n' "${1##$2}"
}
```

**Exemplo de Uso:**

```shell
$ lstrip "The Quick Brown Fox" "The "
Quick Brown Fox
```

## Remover padrão do final da string

**Exemplo de Função:**

```sh
rstrip() {
    # Utilização: rstrip "string" "padrão"
    printf '%s\n' "${1%%$2}"
}
```

**Exemplo de Uso:**

```shell
$ rstrip "The Quick Brown Fox" " Fox"
The Quick Brown
```

## Codificar uma string em percent-encode (URL)

**Exemplo de Função:**

```sh
urlencode() {
    # Utilização: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}
```

**Exemplo de Uso:**

```shell
$ urlencode "https://github.com/dylanaraps/pure-bash-bible"
https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible
```

## Decodificar uma string percent-encoded

**Exemplo de Função:**

```sh
urldecode() {
    # Utilização: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}
```

**Exemplo de Uso:**

```shell
$ urldecode "https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible"
https://github.com/dylanaraps/pure-bash-bible
```

## Verificar se a string contém uma substring

**Usando um teste:**

```shell
if [[ $var == *sub_string* ]]; then
    printf '%s\n' "sub_string is in var."
fi

# Inverso (subcadeia não presente na cadeia).
if [[ $var != *sub_string* ]]; then
    printf '%s\n' "sub_string is not in var."
fi

# Isso também funciona para matrizes!
if [[ ${arr[*]} == *sub_string* ]]; then
    printf '%s\n' "sub_string is in array."
fi
```

**Usando uma declaração case:**

```shell
case "$var" in
    *sub_string*)
        # Faça coisas
    ;;

    *sub_string2*)
        # Faça mais coisas
    ;;

    *)
        # Caso contrário (else)
    ;;
esac
```

## Verificar se a string começa com uma substring

```shell
if [[ $var == sub_string* ]]; then
    printf '%s\n' "var starts with sub_string."
fi

# Inverso (var não começa com sub_string).
if [[ $var != sub_string* ]]; then
    printf '%s\n' "var does not start with sub_string."
fi
```

## Verificar se a string termina com uma substring

```shell
if [[ $var == *sub_string ]]; then
    printf '%s\n' "var ends with sub_string."
fi

# Inverso (var não termina com sub_string).
if [[ $var != *sub_string ]]; then
    printf '%s\n' "var does not end with sub_string."
fi
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# ARRAYS

## Inverter um array

Habilitar o `extdebug` permite acesso ao array `BASH_ARGV`, que armazena os argumentos da função atual na ordem inversa.

**AVISO**: Requer `shopt -s compat44` no `bash` 5.0+.

**Exemplo de Função:**

```sh
reverse_array() {
    # Utilização: reverse_array “matriz”
    shopt -s extdebug
    f()(printf '%s\n' "${BASH_ARGV[@]}"); f "$@"
    shopt -u extdebug
}
```

**Exemplo de Uso:**

```shell
$ reverse_array 1 2 3 4 5
5
4
3
2
1

$ arr=(red blue green)
$ reverse_array "${arr[@]}"
green
blue
red
```

## Remover elementos duplicados do array

Cria um array associativo temporário. Ao definir valores em arrays associativos e ocorrer uma atribuição duplicada, o bash sobrescreve a chave. Isso nos permite remover efetivamente duplicatas do array.

**AVISO:** Requer `bash` 4+

**AVISO:** A ordem da lista pode não permanecer a mesma.

**Exemplo de Função:**

```sh
remove_array_dups() {
    # Utilização: remove_array_dups "array"
    declare -A tmp_array

    for i in "$@"; do
        [[ $i ]] && IFS=" " tmp_array["${i:- }"]=1
    done

    printf '%s\n' "${!tmp_array[@]}"
}
```

**Exemplo de Uso:**

```shell
$ remove_array_dups 1 1 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 5
1
2
3
4
5

$ arr=(red red green blue blue)
$ remove_array_dups "${arr[@]}"
red
green
blue
```

## Elemento aleatório do array

**Exemplo de Função:**

```sh
random_array_element() {
    # Utilização: random_array_element "array"
    local arr=("$@")
    printf '%s\n' "${arr[RANDOM % $#]}"
}
```

**Exemplo de Uso:**

```shell
$ array=(red green blue yellow brown)
$ random_array_element "${array[@]}"
yellow

# Também é possível passar vários argumentos.
$ random_array_element 1 2 3 4 5 6 7
3
```

## Ciclar através de um array

Cada vez que o `printf` é chamado, o próximo elemento do array é impresso. Quando a impressão atinge o último elemento do array, ela recomeça do primeiro elemento.

```sh
arr=(a b c d)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}
```


## Alternar entre dois valores

Isso funciona da mesma maneira que acima, é apenas um caso de uso diferente.

```sh
arr=(true false)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# LOOPS (LAÇOS)

## Loop sobre um intervalo de números

Alternativa ao `seq`.

```shell
# Loop de 0 a 100 (sem suporte a variáveis).
for i in {0..100}; do
    printf '%s\n' "$i"
done
```

## Loop sobre um intervalo variável de números

Alternativa ao `seq`.

```shell
# Loop de 0-VAR.
VAR=50
for ((i=0;i<=VAR;i++)); do
    printf '%s\n' "$i"
done
```

## Loop sobre um array

```shell
arr=(apples oranges tomatoes)

# Apenas elementos.
for element in "${arr[@]}"; do
    printf '%s\n' "$element"
done
```

## Loop sobre um array com um índice

```shell
arr=(apples oranges tomatoes)

# Elementos e índice.
for i in "${!arr[@]}"; do
    printf '%s\n' "${arr[i]}"
done

# Método alternativo.
for ((i=0;i<${#arr[@]};i++)); do
    printf '%s\n' "${arr[i]}"
done
```

## Loop sobre o conteúdo de um arquivo

```shell
while read -r line; do
    printf '%s\n' "$line"
done < "file"
```

## Loop sobre arquivos e diretórios

Não use o `ls`.

```shell
# Exemplo ganancioso.
for file in *; do
    printf '%s\n' "$file"
done

# Arquivos PNG no diretório.
for file in ~/Pictures/*.png; do
    printf '%s\n' "$file"
done

# Iterar sobre diretórios.
for dir in ~/Downloads/*/; do
    printf '%s\n' "$dir"
done

# Expansão da chaves.
for file in /path/to/parentdir/{file1,file2,subdir/file3}; do
    printf '%s\n' "$file"
done

# Itere recursivamente.
shopt -s globstar
for file in ~/Pictures/**/*; do
    printf '%s\n' "$file"
done
shopt -u globstar
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# MANIPULAÇÃO DE ARQUIVOS

**AVISO:** O `bash` não lida corretamente com dados binários em versões `< 4.4`.

## Ler um arquivo para uma string

Alternativa ao comando `cat`.

```shell
file_data="$(<"file")"
```

## Ler um arquivo para um array (*por linha*)

Alternativa ao comando `cat`.

```shell
# Bash <4 (descartando linhas vazias).
IFS=$'\n' read -d "" -ra file_data < "file"

# Bash <4 (preservando linhas em branco).
while read -r line; do
    file_data+=("$line")
done < "file"

# Bash 4+
mapfile -t file_data < "file"
```

## Obter as primeiras N linhas de um arquivo

Alternativa ao comando `head`.

**AVISO:** Requer `bash` 4+

**Exemplo de Função:**

```sh
head() {
    # Utilização: head “n” “arquivo”
    mapfile -tn "$1" line < "$2"
    printf '%s\n' "${line[@]}"
}
```

**Exemplo de Uso:**

```shell
$ head 2 ~/.bashrc
# Prompt
PS1='➜ '

$ head 1 ~/.bashrc
# Prompt
```

## Obter as últimas N linhas de um arquivo

Alternativa ao comando `tail`.

**AVISO:** Requer `bash` 4+

**Exemplo de Função:**

```sh
tail() {
    # Utilização: tail “n” “arquivo”
    mapfile -tn 0 line < "$2"
    printf '%s\n' "${line[@]: -$1}"
}
```

**Exemplo de Uso:**

```shell
$ tail 2 ~/.bashrc
# Ativar o tmux.
# [[ -z "$TMUX"  ]] && exec tmux

$ tail 1 ~/.bashrc
# [[ -z "$TMUX"  ]] && exec tmux
```

## Obter o número de linhas em um arquivo

Alternativa ao `wc -l`.

**Exemplo de Função (bash 4):**

```sh
lines() {
    # Utilização: linhas “arquivo”
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}
```

**Exemplo de Função (bash 3):**

Este método usa menos memória que o método `mapfile` e funciona no `bash` 3, mas é mais lento para arquivos maiores.

```sh
lines_loop() {
    # Utilização: lines_loop “arquivo”
    count=0
    while IFS= read -r _; do
        ((count++))
    done < "$1"
    printf '%s\n' "$count"
}
```

**Exemplo de Uso:**

```shell
$ lines ~/.bashrc
48

$ lines_loop ~/.bashrc
48
```

## Contar arquivos ou diretórios em um diretório

Isso funciona passando a saída do glob para a função e, em seguida, contando o número de argumentos.

**Exemplo de Função:**

```sh
count() {
    # Utilização: count /path/to/dir/*
    #             count /path/to/dir/*/
    printf '%s\n' "$#"
}
```

**Exemplo de Uso:**

```shell
# Contar todos os arquivos no diretório.
$ count ~/Downloads/*
232

# Contar todas as pastas na pasta.
$ count ~/Downloads/*/
45

# Contar todos os arquivos jpg no diretório.
$ count ~/Pictures/*.jpg
64
```

## Criar um arquivo vazio

Alternativa ao `touch`.

```shell
# Mais curto.
>file

# Alternativas mais longas:
:>file
echo -n >file
printf '' >file
```

## Extrair linhas entre dois marcadores

**Exemplo de Função:**

```sh
extract() {
    # Utilização: extract arquivo “marcador de abertura” “marcador de fechamento”
    while IFS=$'\n' read -r line; do
        [[ $extract && $line != "$3" ]] &&
            printf '%s\n' "$line"

        [[ $line == "$2" ]] && extract=1
        [[ $line == "$3" ]] && extract=
    done < "$1"
}
```

**Exemplo de Uso:**

```shell
# Extrair blocos de código do arquivo MarkDown.
$ extract ~/projects/pure-bash/README.md '```sh' '```'
# Saída aqui...
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# CAMINHOS DE ARQUIVO

## Obter o nome do diretório de um caminho de arquivo

Alternativa ao comando `dirname`.

**Exemplo de Função:**

```sh
dirname() {
    # Utilização: dirname “path/caminho”
    local tmp=${1:-.}

    [[ $tmp != *[!/]* ]] && {
        printf '/\n'
        return
    }

    tmp=${tmp%%"${tmp##*[!/]}"}

    [[ $tmp != */* ]] && {
        printf '.\n'
        return
    }

    tmp=${tmp%/*}
    tmp=${tmp%%"${tmp##*[!/]}"}

    printf '%s\n' "${tmp:-/}"
}
```

**Exemplo de Uso:**

```shell
$ dirname ~/Pictures/Wallpapers/1.jpg
/home/black/Pictures/Wallpapers

$ dirname ~/Pictures/Downloads/
/home/black/Pictures
```

## Obter o nome base de um caminho de arquivo

Alternativa ao comando `basename`.

**Exemplo de Função:**

```sh
basename() {
    # Utilização: basename “path/caminho” [“sufixo”]
    local tmp

    tmp=${1%"${1##*[!/]}"}
    tmp=${tmp##*/}
    tmp=${tmp%"${2/"$tmp"}"}

    printf '%s\n' "${tmp:-/}"
}
```

**Exemplo de Uso:**

```shell
$ basename ~/Pictures/Wallpapers/1.jpg
1.jpg

$ basename ~/Pictures/Wallpapers/1.jpg .jpg
1

$ basename ~/Pictures/Downloads/
Downloads
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# VARIÁVEIS

## Atribuir e acessar uma variável usando uma variável

```shell
$ hello_world="value"

# Crie o nome da variável.
$ var="world"
$ ref="hello_$var"

# Imprima o valor da variável nome armazenada em ‘hello_$var’.
$ printf '%s\n' "${!ref}"
value
```

Alternativamente, no `bash` 4.3+:

```shell
$ hello_world="value"
$ var="world"

# Declarar uma referência de nome (nameref).
$ declare -n ref=hello_$var

$ printf '%s\n' "$ref"
value
```

## Nomear uma variável com base em outra variável

```shell
$ var="world"
$ declare "hello_$var=value"
$ printf '%s\n' "$hello_world"
value
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# SEQUÊNCIAS DE ESCAPE

Ao contrário da crença popular, não há problema em utilizar sequências de escape brutas. Usar `tput` abstrai as mesmas sequências ANSI como se fossem impressas manualmente. Pior ainda, o `tput` não é realmente portável. Existem várias variantes do `tput`, cada uma com comandos e sintaxes diferentes (*tente `tput setaf 3` em um sistema FreeBSD*). Sequências brutas são aceitáveis.

## Cores de Texto

**NOTA:** Sequências que requerem valores RGB funcionam apenas em Emuladores de Terminal True-Color.

| Sequência | O que faz? | Valor |
| -------- | ---------------- | ----- |
| `\e[38;5;<NUM>m` | Define a cor do texto (primeiro plano). | `0-255`
| `\e[48;5;<NUM>m` | Define a cor de fundo do texto. | `0-255`
| `\e[38;2;<R>;<G>;<B>m` | Define a cor do texto para cor RGB. | `R`, `G`, `B`
| `\e[48;2;<R>;<G>;<B>m` | Define a cor de fundo para cor RGB. | `R`, `G`, `B`

## Atributos de Texto

**NOTA:** Adicione o prefixo 2 a qualquer código abaixo para desligar seu efeito
(exemplos: 21=texto negrito desligado, 22=texto fraco desligado, 23=texto itálico desligado).

| Sequência | O que faz? |
| -------- | ---------------- |
| `\e[m` | Redefine a formatação e as cores do texto. |
| `\e[1m` | Texto em negrito. |
| `\e[2m` | Texto fraco (faint). |
| `\e[3m` | Texto em itálico. |
| `\e[4m` | Texto sublinhado. |
| `\e[5m` | Texto piscante. |
| `\e[7m` | Texto realçado (cores invertidas). |
| `\e[8m` | Texto oculto. |
| `\e[9m` | Texto tachado (riscado). |


## Movimento do Cursor

| Sequência | O que faz? | Valor |
| -------- | ---------------- | ----- |
| `\e[<LINE>;<COLUMN>H` | Move o cursor para a posição absoluta. | `line`, `column`
| `\e[H` | Move o cursor para a posição inicial (`0,0`). |
| `\e[<NUM>A` | Move o cursor N linhas para cima. | `num`
| `\e[<NUM>B` | Move o cursor N linhas para baixo. | `num`
| `\e[<NUM>C` | Move o cursor N colunas para a direita. | `num`
| `\e[<NUM>D` | Move o cursor N colunas para a esquerda. | `num`
| `\e[s` | Salva a posição do cursor. |
| `\e[u` | Restaura a posição do cursor. |


## Apagando Texto

| Sequência | O que faz? |
| -------- | ---------------- |
| `\e[K` | Apaga da posição do cursor até o final da linha.
| `\e[1K` | Apaga da posição do cursor até o início da linha.
| `\e[2K` | Apaga a linha atual inteira.
| `\e[J` | Apaga da linha atual até o final da tela.
| `\e[1J` | Apaga da linha atual até o topo da tela.
| `\e[2J` | Limpa a tela.
| `\e[2J\e[H` | Limpa a tela e move o cursor para `0,0`.


<!-- CHAPTER END -->

<!-- CHAPTER START -->
# EXPANSÃO DE PARÂMETROS

## Indireção

| Parâmetro | O que faz? |
| --------- | ---------------- |
| `${!VAR}` | Acessa uma variável com base no valor de `VAR`.
| `${!VAR*}` | Expande para uma lista separada por `IFS` de nomes de variáveis que começam com `VAR`. |
| `${!VAR@}` | Expande para uma lista separada por `IFS` de nomes de variáveis que começam com `VAR`. Se estiver entre aspas duplas, cada nome de variável se expande para uma palavra separada. |


## Substituição

| Parâmetro | O que faz? |
| --------- | ---------------- |
| `${VAR#PATTERN}` | Remove a correspondência mais curta do padrão do início da string. |
| `${VAR##PATTERN}` | Remove a correspondência mais longa do padrão do início da string. |
| `${VAR%PATTERN}` | Remove a correspondência mais curta do padrão do final da string. |
| `${VAR%%PATTERN}` | Remove a correspondência mais longa do padrão do final da string. |
| `${VAR/PATTERN/REPLACE}` | Substitui a primeira correspondência pela string.
| `${VAR//PATTERN/REPLACE}` | Substitui todas as correspondências pela string.
| `${VAR/PATTERN}` | Remove a primeira correspondência.
| `${VAR//PATTERN}` | Remove todas as correspondências.

## Comprimento

| Parâmetro | O que faz? |
| --------- | ---------------- |
| `${#VAR}` | Comprimento da variável em caracteres.
| `${#ARR[@]}` | Comprimento do array em elementos.

## Expansão

| Parâmetro | O que faz? |
| --------- | ---------------- |
| `${VAR:OFFSET}` | Remove os primeiros `N` caracteres da variável.
| `${VAR:OFFSET:LENGTH}` | Obter substring do caractere `N` até o caractere `N` (tamanho). <br> (`${VAR:10:10}`: Obter sub-string do char `10` até o char `20`)
| `${VAR:: OFFSET}` | Obter os primeiros `N` caracteres da variável.
| `${VAR:: -OFFSET}` | Remove os últimos `N` caracteres da variável.
| `${VAR: -OFFSET}` | Obter os últimos `N` caracteres da variável.
| `${VAR:OFFSET:-OFFSET}` | Corta os primeiros `N` caracteres e os últimos `N` caracteres. | `bash 4.2+` |

## Modificação de Caixa (Maiúscula/Minúscula)

| Parâmetro | O que faz? | AVISO |
| --------- | ---------------- | ------ |
| `${VAR^}` | Maiúscula no primeiro caractere. | `bash 4+` |
| `${VAR^^}` | Maiúscula em todos os caracteres. | `bash 4+` |
| `${VAR,}` | Minúscula no primeiro caractere. | `bash 4+` |
| `${VAR,,}` | Minúscula em todos os caracteres. | `bash 4+` |
| `${VAR~}` | Inverte a caixa do primeiro caractere. | `bash 4+` |
| `${VAR~~}` | Inverte a caixa de todos os caracteres. | `bash 4+` |


## Valor Padrão

| Parâmetro | O que faz? |
| --------- | ---------------- |
| `${VAR:-STRING}` | Se `VAR` estiver vazia ou não definida, use `STRING` como seu valor.
| `${VAR-STRING}` | Se `VAR` não estiver definida, use `STRING` como seu valor.
| `${VAR:=STRING}` | Se `VAR` estiver vazia ou não definida, define o valor de `VAR` como `STRING`.
| `${VAR=STRING}` | Se `VAR` não estiver definida, define o valor de `VAR` como `STRING`.
| `${VAR:+STRING}` | Se `VAR` não estiver vazia, use `STRING` como seu valor.
| `${VAR+STRING}` | Se `VAR` estiver definida, use `STRING` como seu valor.
| `${VAR:?STRING}` | Exibe um erro se estiver vazia ou não definida.
| `${VAR?STRING}` | Exibe um erro se não estiver definida.


<!-- CHAPTER END -->

<!-- CHAPTER START -->
# EXPANSÃO DE CHAVES

## Intervalos

```shell
# Sintaxe: {<INICIO>..<FIM>}

# Imprima os números de 1 a 100.
echo {1..100}

# Imprimir intervalo de valores flutuantes.
echo 1.{1..9}

# Imprimir caracteres de a a z.
echo {a..z}
echo {A..Z}

# Aninhamento.
echo {A..Z}{0..9}

# Imprimir números com preenchimento zero.
# AVISO: bash 4+
echo {01..100}

# Alterar valor do incremento.
# Sintaxe: {<INICIO>..<FIM>..<INCREMENTO>}
# AVISO: bash 4+
echo {1..10..2} # Incrementar em 2.
```

## Listas de Strings

```shell
echo {apples,oranges,pears,grapes}

# Exemplo de uso:
# Remova as pastas Filmes, Música e ISOS de ~/Downloads/.
rm -rf ~/Downloads/{Movies,Music,ISOS}
```

<!-- CHAPTER END -->


<!-- CHAPTER START -->

# EXPRESSÕES CONDICIONAIS

## Condicionais de Arquivo

| Expressão | Valor  | O que faz? |
| ---------- | ------ | ---------------- |
| `-a`       | `file` | Se o arquivo existe.
| `-b`       | `file` | Se o arquivo existe e é um arquivo especial de bloco.
| `-c`       | `file` | Se o arquivo existe e é um arquivo especial de caractere.
| `-d`       | `file` | Se o arquivo existe e é um diretório.
| `-e`       | `file` | Se o arquivo existe.
| `-f`       | `file` | Se o arquivo existe e é um arquivo regular.
| `-g`       | `file` | Se o arquivo existe e seu bit set-group-id está definido.
| `-h`       | `file` | Se o arquivo existe e é um link simbólico.
| `-k`       | `file` | Se o arquivo existe e seu sticky-bit está definido.
| `-p`       | `file` | Se o arquivo existe e é um pipe nomeado (*FIFO*).
| `-r`       | `file` | Se o arquivo existe e é legível.
| `-s`       | `file` | Se o arquivo existe e seu tamanho é maior que zero.
| `-t`       | `fd`   | Se o descritor de arquivo está aberto e refere-se a um terminal.
| `-u`       | `file` | Se o arquivo existe e seu bit set-user-id está definido.
| `-w`       | `file` | Se o arquivo existe e é gravável (writable).
| `-x`       | `file` | Se o arquivo existe e é executável.
| `-G`       | `file` | Se o arquivo existe e pertence ao ID de grupo efetivo.
| `-L`       | `file` | Se o arquivo existe e é um link simbólico.
| `-N`       | `file` | Se o arquivo existe e foi modificado desde a última leitura.
| `-O`       | `file` | Se o arquivo existe e pertence ao ID de usuário efetivo.
| `-S`       | `file` | Se o arquivo existe e é um socket.

## Comparações de Arquivo

| Expressão | O que faz? |
| ---------- | ---------------- |
| `file -ef file2` | Se ambos os arquivos referem-se ao mesmo inode e números de dispositivo.
| `file -nt file2` | Se `file` é mais novo que `file2` (*usa o tempo de modificação*) ou `file` existe e `file2` não.
| `file -ot file2` | Se `file` é mais velho que `file2` (*usa o tempo de modificação*) ou `file2` existe e `file` não.

## Condicionais de Variável

| Expressão | Valor | O que faz? |
| ---------- | ----- | ---------------- |
| `-o`       | `opt` | Se a opção do shell está habilitada.
| `-v`       | `var` | Se a variável tem um valor atribuído.
| `-R`       | `var` | Se a variável é uma referência de nome (nameref).
| `-z`       | `var` | Se o comprimento da string é zero.
| `-n`       | `var` | Se o comprimento da string é diferente de zero.

## Comparações de Variável

| Expressão | O que faz? |
| ---------- | ---------------- |
| `var = var2` | Igual a.
| `var == var2` | Igual a (*sinônimo para `=`*).
| `var != var2` | Diferente de.
| `var < var2` | Menor que (*em ordem alfabética ASCII.*)
| `var > var2` | Maior que (*em ordem alfabética ASCII.*)

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# OPERADORES ARITMÉTICOS

## Atribuição

| Operadores | O que faz? |
| --------- | ---------------- |
| `=`       | Inicializa ou altera o valor de uma variável.

## Aritmética

| Operadores | O que faz? |
| --------- | ---------------- |
| `+` | Adição
| `-` | Subtração
| `*` | Multiplicação
| `/` | Divisão
| `**` | Exponenciação
| `%` | Módulo (Resto)
| `+=` | Mais-Igual (*Incrementa uma variável.*)
| `-=` | Menos-Igual (*Decrementa uma variável.*)
| `*=` | Vezes-Igual (*Multiplica uma variável.*)
| `/=` | Barra-Igual (*Divide uma variável.*)
| `%=` | Mod-Igual (*Resto da divisão de uma variável.*)

## Bitwise (Bit a bit)

| Operadores | O que faz? |
| --------- | ---------------- |
| `<<` | Bitwise Left Shift (Deslocamento à Esquerda)
| `<<=` | Left-Shift-Equal
| `>>` | Bitwise Right Shift (Deslocamento à Direita)
| `>>=` | Right-Shift-Equal
| `&` | Bitwise AND (E)
| `&=` | Bitwise AND-Equal
| `\|` | Bitwise OR (OU)
| `\|=` | Bitwise OR-Equal
| `~` | Bitwise NOT (NÃO)
| `^` | Bitwise XOR (OU Exclusivo)
| `^=` | Bitwise XOR-Equal

## Lógico

| Operadores | O que faz? |
| --------- | ---------------- |
| `!` | NOT (NÃO)
| `&&` | AND (E)
| `\|\|` | OR (OU)

## Diversos

| Operadores | O que faz? | Exemplo |
| --------- | ---------------- | ------- |
| `,` | Separador por vírgula | `((a=1,b=2,c=3))`


<!-- CHAPTER END -->

<!-- CHAPTER START -->
# ARITMÉTICA

## Sintaxe mais simples para definir variáveis

```shell
# Matemática simples
((var=1+2))

# Variável de decremento/incremento
((var++))
((var--))
((var+=1))
((var-=1))

# Usando variáveis
((var=var2*arr[2]))
```

## Testes Ternários

```shell
# Defina o valor de var como var2 se var2 for maior que var.
# var: variável a ser definida.
# var2>var: Condição a ser testada.
# ?var2: Se o teste for bem-sucedido.
# :var: Se o teste falhar.
((var=var2>var?var2:var))
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# TRAPS (ARMADILHAS)

Traps permitem que um script execute código em vários sinais. No [pxltrm](https://github.com/dylanaraps/pxltrm) (*um editor de pixel art escrito em bash*), traps são usados para redesenhar a interface do usuário no redimensionamento da janela. Outro caso de uso é a limpeza de arquivos temporários na saída do script.

Traps devem ser adicionados perto do início dos scripts para que quaisquer erros iniciais também sejam capturados.

**NOTA:** Para uma lista completa de sinais, veja `trap -l`.


## Fazer algo ao sair do script

```shell
# Limpar a tela ao sair do script.
trap 'printf \\e[2J\\e[H\\e[m' EXIT
```

## Ignorar interrupção do terminal (CTRL+C, SIGINT)

```shell
trap '' INT
```

## Reagir ao redimensionamento da janela

```shell
# Chame uma função ao redimensionar a janela.
trap 'code_here' SIGWINCH
```

## Fazer algo antes de cada comando

```shell
trap 'code_here' DEBUG
```

## Fazer algo quando uma função shell ou arquivo carregado terminar de executar

```shell
trap 'code_here' RETURN
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# PERFORMANCE

## Desativar Unicode

Se o unicode não for necessário, ele pode ser desativado para um aumento de desempenho. Os resultados podem variar, no entanto, houve melhorias notáveis no [neofetch](https://github.com/dylanaraps/neofetch) e em outros programas.

```shell
# Desativar unicode.
LC_ALL=C
LANG=C
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# SINTAXE OBSOLETA

## Shebang

Use `#!/usr/bin/env bash` em vez de `#!/bin/bash`.

- O primeiro pesquisa no `PATH` do usuário para encontrar o binário `bash`.
- O último assume que ele está sempre instalado em `/bin/`, o que pode causar problemas.

**NOTA**: Há momentos em que se pode ter um bom motivo para usar `#!/bin/bash` ou outro caminho direto para o binário.


```shell
# Certo:

    #!/usr/bin/env bash

# Menos certo:

    #!/bin/bash
```

## Substituição de Comando

Use `$()` em vez de `` ` ` ``.

```shell
# Certo.
var="$(command)"

# Errado.
var=`command`

# $() pode ser facilmente aninhado, enquanto `` não pode.
var="$(command "$(command)")"
```

## Declaração de Função

Não use a palavra-chave `function`, isso reduz a compatibilidade com versões mais antigas do `bash`.

```shell
# Certo.
do_something() {
    # ...
}

# Errado.
function do_something() {
    # ...
}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# VARIÁVEIS INTERNAS

## Obter a localização do binário `bash`

```shell
"$BASH"
```

## Obter a versão do processo `bash` atual em execução

```shell
# Como uma string.
"$BASH_VERSION"

# Como um array.
"${BASH_VERSINFO[@]}"
```

## Abrir o editor de texto preferido do usuário

```shell
"$EDITOR" "$file"

# NOTA: Esta variável pode estar vazia, defina um valor alternativo.
"${EDITOR:-vi}" "$file"
```

## Obter o nome da função atual

```shell
# Função atual.
"${FUNCNAME[0]}"

# Função pai.
"${FUNCNAME[1]}"

# E assim por diante.
"${FUNCNAME[2]}"
"${FUNCNAME[3]}"

# Todas as funções, incluindo pais.
"${FUNCNAME[@]}"
```

## Obter o nome do host (hostname) do sistema

```shell
"$HOSTNAME"

# NOTA: Esta variável pode estar vazia.
# Opcionalmente, defina um fallback para o comando hostname.
"${HOSTNAME:-$(hostname)}"
```

## Obter a arquitetura do Sistema Operacional

```shell
"$HOSTTYPE"
```

## Obter o nome do Sistema Operacional / Kernel

Isso pode ser usado para adicionar suporte condicional para diferentes Sistemas Operacionais sem precisar chamar o `uname`.

```shell
"$OSTYPE"
```

## Obter o diretório de trabalho atual

Esta é uma alternativa ao comando interno `pwd`.

```shell
"$PWD"
```

## Obter o número de segundos que o script está rodando

```shell
"$SECONDS"
```

## Obter um inteiro pseudoaleatório

Cada vez que `$RANDOM` é usado, um inteiro diferente entre `0` e `32767` é retornado. Esta variável não deve ser usada para nada relacionado à segurança (*isso inclui chaves de criptografia, etc*).


```shell
"$RANDOM"
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# INFORMAÇÕES SOBRE O TERMINAL

## Obter o tamanho do terminal em linhas e colunas (*de um script*)

Isso é útil ao escrever scripts em bash puro e quando `stty`/`tput` não podem ser chamados.

**Exemplo de Função:**

```sh
get_term_size() {
    # Utilização: get_term_size

    # (:;:) é um micro-sono para garantir que as variáveis sejam
    # exportadas imediatamente.
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}
```

**Exemplo de Uso:**

```shell
# Saída: LINHAS COLUNAS
$ get_term_size
15 55
```

## Obter o tamanho do terminal em pixels

**AVISO**: Isso não funciona em alguns emuladores de terminal.

**Exemplo de Função:**

```sh
get_window_size() {
    # Utilização: get_window_size
    printf '%b' "${TMUX:+\\ePtmux;\\e}\\e[14t${TMUX:+\\e\\\\}"
    IFS=';t' read -d t -t 0.05 -sra term_size
    printf '%s\n' "${term_size[1]}x${term_size[2]}"
}
```

**Exemplo de Uso:**

```shell
# Saída: LARGURA x ALTURA       (WIDTHxHEIGHT)
$ get_window_size
1200x800

# Saída (falha):
$ get_window_size
x
```

## Obter a posição atual do cursor

Isso é útil ao criar uma TUI (Interface de Usuário baseada em Texto) em bash puro.

**Exemplo de Função:**

```sh
get_cursor_pos() {
    # Utilização: get_cursor_pos
    IFS='[;' read -p $'\e[6n' -d R -rs _ y x _
    printf '%s\n' "$x $y"
}
```

**Exemplo de Uso:**

```shell
# Saída: X Y
$ get_cursor_pos
1 8
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# CONVERSÃO

## Converter uma cor hex para RGB

**Exemplo de Função:**

```sh
hex_to_rgb() {
    # Utilização: hex_to_rgb “#FFFFFF”
    #             hex_to_rgb “000000”
    : "${1/\#}"
    ((r=16#${_:0:2},g=16#${_:2:2},b=16#${_:4:2}))
    printf '%s\n' "$r $g $b"
}
```

**Exemplo de Uso:**

```shell
$ hex_to_rgb "#FFFFFF"
255 255 255
```


## Converter uma cor RGB para hex

**Exemplo de Função:**

```sh
rgb_to_hex() {
    # Utilização: rgb_to_hex "r" "g" "b"
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}
```

**Exemplo de Uso:**

```shell
$ rgb_to_hex "255" "255" "255"
#FFFFFF
```


# CODE GOLF

## Sintaxe de loop `for` mais curta

```shell
# Estilo Tiny C.
for((;i++<10;)){ echo "$i";}

# Método não documentado.
for i in {1..10};{ echo "$i";}

# Expansão.
for i in {1..10}; do echo "$i"; done

# Estilo C.
for((i=0;i<=10;i++)); do echo "$i"; done
```

## Loops infinitos mais curtos

```shell
# Método normal
while :; do echo hi; done

# Mais curto
for((;;)){ echo hi;}
```

## Declaração de função mais curta

```shell
# Método normal
f(){ echo hi;}

# Usando um subshell
f()(echo hi)

# Usando aritmética
# Isso pode ser usado para atribuir valores inteiros.
# Exemplo: f a=1
#          f a++
f()(($1))

# Usando testes, loops, etc.
# NOTA: “while”, “until”, “case”, “(())”, “[[]]” também podem ser usados.
f()if true; then echo "$1"; fi
f()for i in "$@"; do echo "$i"; done
```

## Sintaxe `if` mais curta

```shell
# Uma linha
# Observação: a terceira instrução pode ser executada quando a primeira for verdadeira
[[ $var == hello ]] && echo hi || echo bye
[[ $var == hello ]] && { echo hi; echo there; } || echo bye

# Várias linhas (sem else, instrução única)
# Observação: o status de saída pode não ser o mesmo que em uma instrução if
[[ $var == hello ]] &&
    echo hi

# Várias linhas (sem else)
[[ $var == hello ]] && {
    echo hi
    # ...
}
```

## Declaração `case` mais simples para definir variável

O comando interno `:` pode ser usado para evitar repetir `variable=` em uma declaração case. A variável `$_` armazena o último argumento do último comando. `:` sempre é bem-sucedido, então pode ser usado para armazenar o valor da variável.

```shell
# Trecho modificado do Neofetch.
case "$OSTYPE" in
    "darwin"*)
        : "MacOS"
    ;;

    "linux"*)
        : "Linux"
    ;;

    *"bsd"* | "dragonfly" | "bitrig")
        : "BSD"
    ;;

    "cygwin" | "msys" | "win32")
        : "Windows"
    ;;

    *)
        printf '%s\n' "Unknown OS detected, aborting..." >&2
        exit 1
    ;;
esac

# Por fim, defina a variável.
os="$_"
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->
# OUTROS

## Usar `read` como alternativa ao comando `sleep`

Surpreendentemente, `sleep` é um comando externo e não um comando interno (built-in) do `bash`.

**AVISO:** Requer `bash` 4+

**Exemplo de Função:**

```sh
read_sleep() {
    # Utilização: read_sleep 1
    #        read_sleep 0.2
    read -rt "$1" <> <(:) || :
}
```

**Exemplo de Uso:**

```shell
read_sleep 1
read_sleep 0.1
read_sleep 30
```

Para situações críticas de desempenho, onde não é econômico abrir e fechar um número excessivo de descritores de arquivo, a alocação de um descritor de arquivo pode ser feita apenas uma vez para todas as invocações de `read`:

(Veja a implementação original genérica em https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever)

```shell
exec {sleep_fd}<> <(:)
while some_quick_test; do
    # equivalente a sleep 0.001
    read -t 0.001 -u $sleep_fd
done
```

## Verificar se um programa está no PATH do usuário

```shell
# Existem três maneiras de fazer isso e qualquer uma delas pode ser usada.
type -p executable_name &>/dev/null
hash executable_name &>/dev/null
command -v executable_name &>/dev/null

# Como teste.
if type -p executable_name &>/dev/null; then
    # Program is in PATH.
fi

# Inverso.
if ! type -p executable_name &>/dev/null; then
    # Program is not in PATH.
fi

# Exemplo (Saia antecipadamente se o programa não estiver instalado).
if ! type -p convert &>/dev/null; then
    printf '%s\n' "error: convert is not installed, exiting..."
    exit 1
fi
```

## Obter a data atual usando `strftime`

O `printf` do Bash tem um método nativo de obter a data que pode ser usado no lugar do comando `date`.

**AVISO:** Requer `bash` 4+

**Exemplo de Função:**

```sh
date() {
    # Utilização: data “formato”
    # Consulte: ‘man strftime’ para obter informações sobre o formato.
    printf "%($1)T\\n" "-1"
}
```

**Exemplo de Uso:**

```shell
# Usando a função acima.
$ date "%a %d %b  - %l:%M %p"
Fri 15 Jun  - 10:00 AM

# Usando printf diretamente.
$ printf '%(%a %d %b  - %l:%M %p)T\n' "-1"
Fri 15 Jun  - 10:00 AM

# Atribuir uma variável usando printf.
$ printf -v date '%(%a %d %b  - %l:%M %p)T\n' '-1'
$ printf '%s\n' "$date"
Fri 15 Jun  - 10:00 AM
```

## Obter o nome de usuário do usuário atual

**AVISO:** Requer `bash` 4.4+

```shell
$ : \\u
# Expanda o parâmetro como se fosse uma string de prompt.
$ printf '%s\n' "${_@P}"
black
```

## Gerar um UUID V4

**AVISO**: O valor gerado não é criptograficamente seguro.

**Exemplo de Função:**

```sh
uuid() {
    # Utilização: uuid
    C="89ab"

    for ((N=0;N<16;++N)); do
        B="$((RANDOM%256))"

        case "$N" in
            6)  printf '4%x' "$((B%16))" ;;
            8)  printf '%c%x' "${C:$RANDOM%${#C}:1}" "$((B%16))" ;;

            3|5|7|9)
                printf '%02x-' "$B"
            ;;

            *)
                printf '%02x' "$B"
            ;;
        esac
    done

    printf '\n'
}
```

**Exemplo de Uso:**

```shell
$ uuid
d5b6c731-1310-4c24-9fe3-55d556d44374
```

## Barras de progresso

Esta é uma maneira simples de desenhar barras de progresso sem precisar de um loop for na própria função.

**Exemplo de Função:**

```sh
bar() {
    # Utilização: barra 1 10
    #                   ^----- Porcentagem decorrida (0-100).
    #                      ^-- Comprimento total em caracteres.
    ((elapsed=$1*$2/100))

    # Crie a barra com espaços.
    printf -v prog  "%${elapsed}s"
    printf -v total "%$(($2-elapsed))s"

    printf '%s\r' "[${prog// /-}${total}]"
}
```

**Exemplo de Uso:**

```shell
for ((i=0;i<=100;i++)); do
    # Pausas bem curtas em bash puro (só para ilustrar).
    (:;:) && (:;:) && (:;:) && (:;:) && (:;:)

    # Imprima a barra.
    bar "$i" "10"
done

printf '\n'
```

## Obter a lista de funções em um script

```sh
get_functions() {
    # Utilização: get_functions
    IFS=$'\n' read -d "" -ra functions < <(declare -F)
    printf '%s\n' "${functions[@]//declare -f }"
}
```

## Ignorar aliases do shell

```shell
# caso contrário
ls

# comando
# shellcheck disable=SC1001
\ls
```

## Ignorar funções do shell

```shell
# função
ls

# comando
command ls
```

## Executar um comando em segundo plano (background)

Isso executará o comando fornecido e o manterá em execução, mesmo após o término da conexão do terminal ou SSH. Toda a saída é ignorada.

```sh
bkr() {
    (nohup "$@" &>/dev/null &)
}

bkr ./some_script.sh # some_script.sh está agora em execução em segundo plano
```

## Capturar o valor de retorno de uma função sem substituição de comando

**AVISO:** Requer `bash` 4+

Isso usa namerefs locais para evitar o uso de substituição de comando no estilo `var=$(alguma_func)` para capturar a saída da função.

```sh
to_upper() {
  local -n ptr=${1}

  ptr=${ptr^^}
}

foo="bar"
to_upper foo
printf "%s\n" "${foo}" # BAR
```

<!-- CHAPTER END -->

# POSFÁCIO

Obrigado por ler! Se esta bíblia ajudou você de alguma forma e você gostaria de retribuir, considere fazer uma doação. Doações me dão tempo para tornar este o melhor recurso possível. Não pode doar? Tudo bem, dê uma estrela no repositório e compartilhe com seus amigos!

<a href="https://www.patreon.com/dyla"><img src="https://img.shields.io/badge/donate-patreon-yellow.svg"></a>


Rock on. 🤘
