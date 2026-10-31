# Motion Videos Warehouse

Collection of motion videos + generation prompts. Git workspace: this repo holds only docs/scripts; each project below is its own repo (listed in `repos.txt`, git-ignored here). Data is in `warehouse/` (git-ignored, large).

| Project | Role |
|---|---|
| `mvw-core` | shared layout + downloader |
| `mvw-parser-awesome-opus55` | github awesome-opus5-5-videos: prompts, creators, posters |
| `mvw-parser-skillry-opus55` | skillry.dev: original/remake mp4 |
| `mvw-parser-higgsfield-content-factory` | higgsfield.ai/content-factory presets |
| `mvw-viewer` | browse the local warehouse |
| `mvw-importer-local` | copy local mp4+jpg folders into the warehouse |
| `mvw-deploy` | Server 1 stack: nginx media host + daily parsers |

```
warehouse/<source>/<id>/{meta.json,prompt.txt,original.mp4,remake.mp4,poster.*}
```

Refresh: `./run-all.sh` (idempotent; schedule via cron). View: `cd mvw-viewer && PYTHONPATH=../mvw-core python3 -m mvw_viewer`.
New source: copy a parser repo, add it to `repos.txt`.
