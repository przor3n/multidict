if [ -z $MULTIDICT_NO_EXTENSIONS ]; then
    docker pull quay.io/pypa/manylinux1_x86_64
    docker run --rm -v `pwd`:/io quay.io/pypa/manylinux1_x86_64 /io/build-wheels.sh
    docker pull quay.io/pypa/manylinux1_i686
    docker run --rm -v `pwd`:/io quay.io/pypa/manylinux1_i686 linux32 /io/build-wheels.sh
fi

if [ -n $TRAVIS_TAG ]; then
    python -m twine upload dist/* --username andrew.svetlov --password $PYPI_PASSWD
fi