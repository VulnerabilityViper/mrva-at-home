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

mkdir ${path}/${lang}
mkdir ${path}/${lang}/scripts
mkdir ${path}/${lang}/repos
mkdir ${path}/${lang}/databases
mkdir ${path}/${lang}/sarif-files


echo mkdir ${path}/${lang}/sarif-files/'$(date '+%Y-%m-%d')/' > ${path}/${lang}/scripts/analyze_databases.sh
echo 'while read line; do codeql database analyze -j=-2 '${path}/${lang}/databases/'$(date '+%Y-%m-%d')/$line/\
    --format=sarif-latest --output='${path}/${lang}/sarif-files/'$(date '+%Y-%m-%d')/results_${line}_$(date '+%Y-%m-%d').sarif;\
    done < '${path}/${lang}'/scripts/index.txt' >> ${path}/${lang}/scripts/analyze_databases.sh

echo 'while read line; do codeql database create -j=-2 '${path}/${lang}'/databases/$(date '+%Y-%m-%d')/$line/\
    --language='${lang}' --source-root='${path}/${lang}'/repos/$line/; done < '${path}/${lang}/scripts/index.txt\
    > ${path}/${lang}/scripts/database_create.sh

echo 'while read line; do git clone https://github.com/${line}.git' ${path}/${lang}'/repos/${line#*/} ; done\
    < $1' > ${path}/${lang}/scripts/git_repos_gen.sh

chmod +x ${path}/${lang}/scripts/git_repos_gen.sh
chmod +x ${path}/${lang}/scripts/database_create.sh
chmod +x ${path}/${lang}/scripts/analyze_databases.sh

cp ${path}/repo_lists/${lang}/* ${path}/${lang}/scripts/


echo 'ls '${path}/${lang}'/repos/ > '${path}/${lang}'/scripts/index.txt' > ${path}/${lang}/scripts/list_gen.sh
echo 'while read line; do mkdir -p '${path}/${lang}'/databases/$(date '+%Y-%m-%d')/${line} ; done < '${path}/${lang}'/scripts/index.txt'\
     >> ${path}/${lang}/scripts/list_gen.sh

chmod +x ${path}/${lang}/scripts/list_gen.sh