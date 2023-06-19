#!/bin/bash

path=$PWD

echo 'Enter language: cpp, csharp, go, java, javascript, python, ruby, or swift'

read lang_input

case $lang_input in 

    cpp)
    lang=$lang_input
    ;;

    csharp)
    lang=$lang_input
    ;;

    go)
    lang=$lang_input
    ;;

    java)
    lang=$lang_input
    ;;

    javascript)
    lang=$lang_input
    ;;

    python)
    lang=$lang_input
    ;;

    ruby)
    lang=$lang_input
    ;;

    swift)
    lang=$lang_input
    ;;

    *)
    echo 'Only cpp, csharp, go, java, javascript, python, ruby, and swift are supported languages'
    exit 1
    ;;
esac


echo 'Enter top repo list: 10, 100, 1000'

read repo_num_input

case $repo_num_input in 

    10)
    repo_num=$repo_num_input
    ;;

    100)
    repo_num=$repo_num_input
    ;;

    1000)
    repo_num=$repo_num_input
    ;;

    *)
    echo 'Only top 10, 100, and 1000 are supported'
    exit 1
    ;;
esac



${path}/${lang}/scripts/git_repos_gen.sh \
    ${path}/${lang}/scripts/top_${repo_num}_${lang}_10JUN23

${path}/${lang}/scripts/list_gen.sh
${path}/${lang}/scripts/database_create.sh
${path}/${lang}/scripts/analyze_databases.sh