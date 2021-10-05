import wget
from os import mkdir
from shutil import rmtree

with open('code/datasets.txt') as datasets_file:
    urls = datasets_file.readlines()

    if len(urls) > 5:
        raise Exception("Too many datasets were specified")

    rmtree('code/datasets', ignore_errors=True)
    mkdir('code/datasets')

    for u in urls:
        f = wget.download(u.rstrip(), 'code/datasets/')
        print(f)