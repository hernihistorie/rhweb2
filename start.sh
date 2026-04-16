#!/bin/bash
~/.local/bin/uv run gunicorn -w 2 -b 127.0.0.1:4001 rhweb2:app