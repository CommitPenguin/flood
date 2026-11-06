# Flood on the NAS

Flood with its built-in rTorrent (the `Dockerfile.rtorrent` image from
`distribution/containers`), run with docker compose on the NAS.

- Caddy on the host serves flood.nas.lan and proxies to 127.0.0.1:3000.
- `data/` is the `download` user's home inside the container
  (`/home/download`): Flood's database under `.local/share/flood`, rTorrent's
  session under `.local/share/rtorrent`, and the downloads under `media/`.
  On the NAS it lives at /srv/flood/deploy/data and is owned by uid 1001
  (`download` in the image). The copy in this repo is a cut-down copy of it
  from last night, for testing.
- Deploys: `./deploy.sh` (post-merge hook, plus the Sunday 04:00 cron job).
- Login: maren is the only Flood user.
