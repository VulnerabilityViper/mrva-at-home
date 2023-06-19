# mrva-at-home

### The problem
The triditional way to use codeql-cli is to take a single query or a battery of queries and runs them against a single repository. This problem limits the breadth of your vulnerability scans. The solution GitHub has implemented is MRVA (Multi Repository Variant Analysis). This allows you to use github actions to run a single query against  a list of public repositories. One of the major issues with it is you have to use GitHub actions and are limited to 2000 minutes of CPU time per month without having to pay. Each core's time is added up to arrive at the billable time. With some basic test I have seen a single minute be counted as twenty two minutes of "billable time". But the main problem still stands, how do you run many queries against many repositories?

### What is MRVA at Home
MRVA at Home is a basic automation tool the solves two problems at the same time. First, it cuts the cost of compute cycles by a significant ammount. Second, it allows a two dimentional analysis of repositories by running your arsenal of queries against a list of repositories.

### How to use
1. First clone the repo
2. Run the build.sh file and select your language
3. cd into the language dir and then the scripts dir
4. Run git_repos_gen.sh and pass a repolist as an argument (there is a set of repo list included with each language)
5. Run list_gen.sh to generate the database directories and generate a list of installed repos for database_create.sh
6. Run database_create.sh to generate the databases for CodeQL
7. Run analyze_database.sh

### Dependencies
- CodeQL this is an auto mation tool for CodeQL it can be found here: https://github.com/github/codeql
- CodeQL-CLI some of the pacage manager versions don't work well https://github.com/github/codeql-cli-binaries
- Any language specific compilers or interpreters
- Any sarif file veiwer for the results

### Helpful notes
- CodeQL for Swift only works on OSX
- when yo install CodeQL-CLI you can symlink it to your /bin dir or if you use osx your /usr/local/bin dir for easy access
- Disk space can be high when doing more than one language (ie. downloading the top 10 repos in each languuage was 22GB before generating the databases)
- VS Code can be used to view the sarif files with the sarif viewer extension