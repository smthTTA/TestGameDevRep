# Скрипт нужно запускать из той ветки, в которую хотите внести изменения из develop (ветку, из которой тянутся изменения, можно поменять)

param([string]$repoLocalpath)

# Необходимо указать путь к папке, в которой у вас лежит репозиторий (!!! но не к самому репозиторию !!!)
$repoLocalpath = "D:\GameDev"

$dir = Get-ChildItem $repoLocalpath | Where-Object {$_.PSISContainer} | select-object FullName

# Цикл обновит ветки для каждой дериктории, которая будет находится по пути в repoLocalpath
foreach ($d in $dir) 
{
    # Можно заменить\добавить ветки, из которых будут подтягиваться изменения, эти ветки в локальном репозитории так же будут обновлены
    git fetch origin develop:develop
    git merge develop -m "auto pull develop branch"
    # опционально git push, если хотите сразу внести изменения из develop в свою ветку удаленного репозитория 
}

Set-Location $PSScriptRoot;