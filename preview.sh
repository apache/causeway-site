#!/usr/bin/env bash
python -m webbrowser -t http://localhost:4000 && pushd content && python -m http.server 4000 && popd
