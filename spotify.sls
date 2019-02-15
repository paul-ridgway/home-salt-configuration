spotify:
  pkgrepo.managed:
    - humanname: Spotify
    - name: deb http://repository.spotify.com stable non-free
    - file: /etc/apt/sources.list.d/spotify.list
    - keyid: 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: spotify-client

  pkg.latest:
    - name: spotify-client
    - refresh: True
