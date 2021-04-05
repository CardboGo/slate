#!/usr/bin/env bash

docker build . -t slatedocs/slate
docker run --rm --name slate -v $(pwd)/build:/srv/slate/build -v $(pwd)/source:/srv/slate/source slatedocs/slate
git commit -a -m "Update index.md"
git push
./deploy.sh --push-only
