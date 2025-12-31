# Escrevendo a Bíblia

<!-- vim-markdown-toc GFM -->

* [Adicionando Código à Bíblia.](#adding-code-to-the-bible)
* [Significados especiais para blocos de código.](#special-meanings-for-code-blocks)
* [Escrevendo testes](#writing-tests)
* [Executando testes](#running-tests)

<!-- vim-markdown-toc -->

## Adicionando Código à Bíblia.

- O código deve usar apenas comandos internos (built-ins) do `bash`.
    - Um fallback (alternativa) para um programa externo é permitido se o código não funcionar sempre.
    - Exemplo de Fallback: `${HOSTNAME:-$(hostname)}`
- Se possível, envolva o código em uma função.
    - Isso permite que testes sejam escritos.
    - Isso também permite que o `shellcheck` faça a análise estática (lint) corretamente.
    - Um bônus adicional é mostrar um caso de uso funcional.
- Escreva alguns exemplos.
    - Mostre alguma entrada e a saída modificada.


## Significados especiais para blocos de código.

Use `sh` para funções que devem ser analisadas (linted) e testadas unitariamente.

    ```sh
    # O Shellcheck irá verificar isso e o script de teste irá originar isso.
    func() {
        # Utilização: func “arg”
        :
    }
    ```

Use `shell` para código que deve ser ignorado.

    ```shell
    # Sintaxe mais curta para criação de arquivos.
    :>file
    ```

## Escrevendo testes

O arquivo de teste pode ser visualizado aqui: https://github.com/dylanaraps/pure-bash-bible/blob/master/test.sh
Ou aqui: https://github.com/GustavoBorges13/pure-bash-bible-pt-br/blob/main/test.sh (versão traduzida)

Exemplo de teste:

```sh
test_upper() {
    result="$(upper "HeLlO")"
    assert_equals "$result" "HELLO"
}
```

Passos:

1. Escreva o teste.
    - A nomenclatura é `test_func_name`
    - Armazene a saída da função em uma variável (`$result` ou `${result[@]}`).
    - Use `assert_equals` para testar a igualdade entre a variável e a saída esperada.
2. O script de teste o executará automaticamente. :+1:


## Executando testes

Executar o `test.sh` também roda o `shellcheck` no código.

```sh
cd pure-bash-bible
./test.sh
```