#!/usr/bin/env bash
python -m webbrowser -t http://localhost:4000 && pushd content && serve -p 4000 && popd
