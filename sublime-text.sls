sublime_text:
  pkgrepo.managed:
    - humanname: Sublime Text
    - name: deb https://download.sublimetext.com/ apt/stable/ 
    - file: /etc/apt/sources.list.d/sublime-text.list
    - key_url: https://download.sublimetext.com/sublimehq-pub.gpg
    - require_in:
      - pkg: sublime-text 

  pkg.latest:
    - name: sublime-text
    - refresh: True
