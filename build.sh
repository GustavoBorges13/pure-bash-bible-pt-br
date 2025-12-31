#!/usr/bin/env bash
#
# Transforme a Bíblia em um único documento em um livro dividido em capítulos.

main() {
    rm -rf manuscript
    mkdir -p manuscript

    # Divida o README.md em capítulos com base nos marcadores.
    while IFS=$'\n' read -r line; do
        [[ "$chap" ]] && chapter[$i]+="$line"$'\n'
        [[ "$line" == "<!-- CHAPTER START -->" ]] && chap=1
        [[ "$line" == "<!-- CHAPTER END -->" ]]   && { chap=; ((i++)); }
    done < README.md

    # Escreva os capítulos em arquivos separados.
    for i in "${!chapter[@]}"; do
        : "${chapter[$i]/$'\n'*}"; : "${_/\# }"; : "${_,,}"
        printf '%s\n' "${chapter[$i]}" > "manuscript/chapter${i}.txt"
        printf '%s\n' "chapter${i}.txt" >> "manuscript/Book.txt"
    done
}

main
