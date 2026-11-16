# Motion Videos Warehouse

Collection of motion videos + generation prompts. Git workspace: this repo holds only docs/scripts; each project below is its own public repo (listed in `repos.txt`, git-ignored here). Data is in `warehouse/` (git-ignored, large).

| Project | Role |
|---|---|
| [`mvw-core`](https://github.com/suenot/mvw-core) | shared layout + downloader |
| [`mvw-parser-awesome-opus55`](https://github.com/suenot/mvw-parser-awesome-opus55) | github awesome-opus5-5-videos: prompts, creators, posters |
| [`mvw-parser-skillry-opus55`](https://github.com/suenot/mvw-parser-skillry-opus55) | skillry.dev: original/remake mp4 |
| [`mvw-parser-higgsfield-content-factory`](https://github.com/suenot/mvw-parser-higgsfield-content-factory) | higgsfield.ai/content-factory presets |
| [`mvw-viewer`](https://github.com/suenot/mvw-viewer) | browse the warehouse (local server + web UI) |
| [`mvw-importer-local`](https://github.com/suenot/mvw-importer-local) | copy local mp4+jpg folders into the warehouse |
| [`mvw-deploy`](https://github.com/suenot/mvw-deploy) | server stack: nginx media host + daily parsers |
| [`production-warehouse`](https://github.com/suenot/production-warehouse) | built static site |

```
warehouse/<source>/<id>/{meta.json,prompt.txt,original.mp4,remake.mp4,poster.*}
```

## Quick start (your own copy, with parsers)

Needs `git` and Python 3.9+ (parsers are stdlib only). Node 18+ only if you rebuild the UI.

```bash
git clone https://github.com/suenot/motion-videos-warehouse.git && cd motion-videos-warehouse
sed -i.bak 's#git@github.com:#https://github.com/#' repos.txt   # clone over HTTPS, no SSH key needed
./bootstrap.sh                 # clones every repo from repos.txt
./run-all.sh --limit 5         # try all parsers on 5 items each
./run-all.sh                   # full download (idempotent: skips files already present)
cd mvw-viewer && PYTHONPATH=../mvw-core python3 -m mvw_viewer --port 8765   # open http://127.0.0.1:8765
```

Data goes to `./warehouse` (override with `MVW_DATA=/path`). Re-run `./run-all.sh` any time, or from cron, to pick up new items.

- Higgsfield full scroll: set `MVW_PYTHON` to a Python with `camoufox` installed (otherwise static HTML fallback).
- Your own folders of `name.mp4` + `name.jpg`: `./mvw-importer-local/run.sh --source my-source <folders>`.
- New source: copy a parser repo, add it to `repos.txt`.
- Rebuild UI: `cd mvw-viewer/web && npm ci && npm run build`.
- Own server (nginx media host + daily parsers via Docker): see [`mvw-deploy`](https://github.com/suenot/mvw-deploy).
