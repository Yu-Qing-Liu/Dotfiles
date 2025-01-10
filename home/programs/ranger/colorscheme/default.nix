{ config, pkgs, ...}:
{
home.file.".config/ranger/colorschemes/kanagawa.py".text = ''
from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import default_colors, reverse, bold, normal, default


class Kanagawa(ColorScheme):
    progress_bar_color = 108

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 160
            if context.border:
                fg = 222
            if context.image:
                fg = 110
            if context.video:
                attr |= bold
                fg = 109
            if context.audio:
                fg = 110
            if context.document:
                fg = 222
            if context.container:
                attr |= bold
                fg = 179
            if context.directory:
                attr |= bold
                fg = 214
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                attr |= bold
                fg = 151
            if context.socket:
                fg = 180
                attr |= bold
            if context.fifo or context.device:
                fg = 144
                if context.device:
                    attr |= bold
            if context.link:
                fg = 223 if context.good else 116
            if context.bad:
                fg = 244
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (174, 95):
                    fg = 248
                else:
                    fg = 174
            if not context.selected and (context.cut or context.copied):
                fg = 108
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 223
            if context.badinfo:
                if attr & reverse:
                    fg = 95
                else:
                    fg = 95

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = 174 if context.bad else 180
            elif context.directory:
                fg = 223
            elif context.tab:
                if context.good:
                    fg = 180
            elif context.link:
                fg = 116

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 108
                elif context.bad:
                    fg = 174
            if context.marked:
                attr |= bold | reverse
                fg = 223
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 174
            if context.loaded:
                fg = self.progress_bar_color
            if context.vcsinfo:
                fg = 116
                attr &= ~bold
            if context.vcscommit:
                fg = 144
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 116

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    fg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 95
            elif context.vcschanged:
                fg = 174
            elif context.vcsunknown:
                fg = 174
            elif context.vcsstaged:
                fg = 108
            elif context.vcssync:
                fg = 108
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = 108
            elif context.vcsbehind:
                fg = 174
            elif context.vcsahead:
                fg = 116
            elif context.vcsdiverged:
                fg = 95
            elif context.vcsunknown:
                fg = 174

        return fg, bg, attr
'';

home.file.".config/ranger/plugins/ranger_devicons/devicons.py".text = ''
#!/usr/bin/python
# coding=UTF-8
# These glyphs, and the mapping of file extensions to glyphs
# has been copied from the vimscript code that is present in
# https://github.com/ryanoasis/vim-devicons

import re
import os


# Get the XDG_USER_DIRS directory names from environment variables
xdgs_dirs = {
    os.path.basename(os.getenv(key).rstrip('/')): icon
    for key, icon in (
        ('XDG_DOCUMENTS_DIR', ''),
        ('XDG_DOWNLOAD_DIR', ''),
        ('XDG_CONFIG_DIR', ''),
        ('XDG_MUSIC_DIR', ''),
        ('XDG_PICTURES_DIR', ''),
        ('XDG_PUBLICSHARE_DIR', ''),
        ('XDG_TEMPLATES_DIR', ''),
        ('XDG_VIDEOS_DIR', ''),
    )
    if os.getenv(key)
}


# all those glyphs will show as weird squares if you don't have the correct patched font
# My advice is to use NerdFonts which can be found here:
# https://github.com/ryanoasis/nerd-fonts
file_node_extensions = {
    '7z'       : '',
    'a'        : '',
    'ai'       : '',
    'apk'      : '',
    'asm'      : '',
    'asp'      : '',
    'aup'      : '',
    'avi'      : '',
    'awk'      : '',
    'bash'     : '',
    'bat'      : '',
    'bmp'      : '',
    'bz2'      : '',
    'c'        : '',
    'c++'      : '',
    'cab'      : '',
    'cbr'      : '',
    'cbz'      : '',
    'cc'       : '',
    'class'    : '',
    'clj'      : '',
    'cljc'     : '',
    'cljs'     : '',
    'cmake'    : '',
    'coffee'   : '',
    'conf'     : '',
    'cp'       : '',
    'cpio'     : '',
    'cpp'      : '',
    'cs'       : '󰌛',
    'csh'      : '',
    'css'      : '',
    'cue'      : '',
    'cvs'      : '',
    'cxx'      : '',
    'd'        : '',
    'dart'     : '',
    'db'       : '',
    'deb'      : '',
    'diff'     : '',
    'dll'      : '',
    'wps'      : '',
    'wpt'      : '',
    'doc'      : '',
    'docx'     : '',
    'docm'     : '',
    'dotx'     : '',
    'dotm'     : '',
    'dump'     : '',
    'edn'      : '',
    'eex'      : '',
    'efi'      : '',
    'ejs'      : '',
    'elf'      : '',
    'elm'      : '',
    'epub'     : '',
    'erl'      : '',
    'ex'       : '',
    'exe'      : '',
    'exs'      : '',
    'f#'       : '',
    'fifo'     : '󰟥',
    'fish'     : '',
    'flac'     : '',
    'flv'      : '',
    'fs'       : '',
    'fsi'      : '',
    'fsscript' : '',
    'fsx'      : '',
    'gem'      : '',
    'gemspec'  : '',
    'gif'      : '',
    'go'       : '',
    'gz'       : '',
    'gzip'     : '',
    'h'        : '',
    'haml'     : '',
    'hbs'      : '',
    'hh'       : '',
    'hpp'      : '',
    'hrl'      : '',
    'hs'       : '',
    'htaccess' : '',
    'htm'      : '',
    'html'     : '',
    'htpasswd' : '',
    'hxx'      : '',
    'ico'      : '',
    'img'      : '',
    'ini'      : '',
    'ipynb'    : '',
    'iso'      : '',
    'jar'      : '',
    'java'     : '',
    'jl'       : '',
    'jpeg'     : '',
    'jpg'      : '',
    'js'       : '',
    'json'     : '',
    'jsonc'    : '',
    'jsx'      : '',
    'key'      : '',
    'ksh'      : '',
    'leex'     : '',
    'less'     : '',
    'lha'      : '',
    'lhs'      : '',
    'log'      : '',
    'lua'      : '',
    'lz'       : '',
    'lzh'      : '',
    'lzma'     : '',
    'm4a'      : '',
    'm4v'      : '',
    'markdown' : '',
    'md'       : '',
    'mdx'      : '',
    'mjs'      : '',
    'mka'      : '',
    'mkv'      : '',
    'ml'       : 'λ',
    'mli'      : 'λ',
    'mov'      : '',
    'mp3'      : '',
    'mp4'      : '',
    'mpeg'     : '',
    'mpg'      : '',
    'msi'      : '',
    'mustache' : '',
    'nix'      : '',
    'o'        : '',
    'ogg'      : '',
    'opus'     : '',
    'part'     : '',
    'pdf'      : '',
    'php'      : '',
    'pl'       : '',
    'pm'       : '',
    'png'      : '',
    'pp'       : '',
    'dps'      : '',
    'dpt'      : '',
    'ppt'      : '',
    'pptx'     : '',
    'pptm'     : '',
    'pot'      : '',
    'potx'     : '',
    'potm'     : '',
    'pps'      : '',
    'ppsx'     : '',
    'ppsm'     : '',
    'ps1'      : '',
    'psb'      : '',
    'psd'      : '',
    'pub'      : '',
    'py'       : '',
    'pyc'      : '',
    'pyd'      : '',
    'pyo'      : '',
    'r'        : '󰟔',
    'rake'     : '',
    'rar'      : '',
    'rb'       : '',
    'rc'       : '',
    'rlib'     : '',
    'rmd'      : '',
    'rom'      : '',
    'rpm'      : '',
    'rproj'    : '󰗆',
    'rs'       : '',
    'rss'      : '',
    'rtf'      : '',
    's'        : '',
    'sass'     : '',
    'scala'    : '',
    'scss'     : '',
    'sh'       : '',
    'slim'     : '',
    'sln'      : '',
    'so'       : '',
    'sql'      : '',
    'styl'     : '',
    'suo'      : '',
    'svelte'   : '',
    'swift'    : '',
    't'        : '',
    'tar'      : '',
    'tex'      : '󰙩',
    'tgz'      : '',
    'toml'     : '',
    'torrent'  : '',
    'ts'       : '',
    'tsx'      : '',
    'twig'     : '',
    'vim'      : '',
    'vimrc'    : '',
    'vue'      : '󰡄',
    'wav'      : '',
    'webm'     : '',
    'webmanifest' : '',
    'webp'     : '',
    'xbps'     : '',
    'xcplayground' : '',
    'xhtml'    : '',
    'et'       : '󰈛',
    'ett'      : '󰈛',
    'xls'      : '󰈛',
    'xlt'      : '󰈛',
    'xlsx'     : '󰈛',
    'xlsm'     : '󰈛',
    'xlsb'     : '󰈛',
    'xltx'     : '󰈛',
    'xltm'     : '󰈛',
    'xla'      : '󰈛',
    'xlam'     : '󰈛',
    'xml'      : '',
    'xul'      : '',
    'xz'       : '',
    'yaml'     : '',
    'yml'      : '',
    'zip'      : '',
    'zsh'      : '',
}


dir_node_exact_matches = {
# English
    '.git'                             : '',
    'Desktop'                          : '',
    'Documents'                        : '',
    'Downloads'                        : '',
    'Dotfiles'                         : '',
    'Dropbox'                          : '',
    'Music'                            : '',
    'Pictures'                         : '',
    'Public'                           : '',
    'Templates'                        : '',
    'Videos'                           : '',
    'anaconda3'                        : '',
    'go'                               : '',
    'workspace'                        : '',
    'OneDrive'                         : '',
# Spanish
    'Escritorio'                       : '',
    'Documentos'                       : '',
    'Descargas'                        : '',
    'Música'                           : '',
    'Imágenes'                         : '',
    'Público'                          : '',
    'Plantillas'                       : '',
    'Vídeos'                           : '',
# French
    'Bureau'                           : '',
    'Documents'                        : '',
    'Images'                           : '',
    'Musique'                          : '',
    'Publique'                         : '',
    'Téléchargements'                  : '',
    'Vidéos'                           : '',
# Portuguese
    'Documentos'                       : '',
    'Imagens'                          : '',
    'Modelos'                          : '',
    'Música'                           : '',
    'Público'                          : '',
    'Vídeos'                           : '',
    'Área de trabalho'                 : '',
# Italian
    'Documenti'                        : '',
    'Immagini'                         : '',
    'Modelli'                          : '',
    'Musica'                           : '',
    'Pubblici'                         : '',
    'Scaricati'                        : '',
    'Scrivania'                        : '',
    'Video'                            : '',
# German
    'Bilder'                           : '',
    'Dokumente'                        : '',
    'Musik'                            : '',
    'Schreibtisch'                     : '',
    'Vorlagen'                         : '',
    'Öffentlich'                       : '',
# Hungarian
    'Dokumentumok'                     : '',
    'Képek'                            : '',
    'Modelli'                          : '',
    'Zene'                             : '',
    'Letöltések'                       : '',
    'Számítógép'                       : '',
    'Videók'                           : '',
# Chinese(Simple)
    '桌面'                             : '',
    '文档'                             : '',
    '下载'                             : '',
    '音乐'                             : '',
    '图片'                             : '',
    '公共的'                           : '',
    '公共'                           : '',
    '模板'                             : '',
    '视频'                             : '',
# Chinese(Traditional)
    '桌面'                             : '',
    '文檔'                             : '',
    '下載'                             : '',
    '音樂'                             : '',
    '圖片'                             : '',
    '公共的'                           : '',
    '公共'                           : '',
    '模板'                             : '',
    '視頻'                             : '',
# Swedish
    'Skrivbord'                          : '',
    'Dokument'                        : '',
    'Hämtningar'                        : '',
    'Musik'                            : '',
    'Bilder'                         : '',
    'Public'                           : '',
    'Mallar'                        : '',
    'Video'                           : '',
}

# Python 2.x-3.4 don't support unpacking syntex `{**dict}`
# XDG_USER_DIRS
dir_node_exact_matches.update(xdgs_dirs)


file_node_exact_matches = {
    '.bash_aliases'                    : '',
    '.bash_history'                    : '',
    '.bash_logout'                     : '',
    '.bash_profile'                    : '',
    '.bashprofile'                     : '',
    '.bashrc'                          : '',
    '.dmrc'                            : '',
    '.DS_Store'                        : '',
    '.fasd'                            : '',
    '.fehbg'                           : '',
    '.gitattributes'                   : '',
    '.gitconfig'                       : '',
    '.gitignore'                       : '',
    '.gitlab-ci.yml'                   : '',
    '.gvimrc'                          : '',
    '.inputrc'                         : '',
    '.jack-settings'                   : '',
    '.mime.types'                      : '',
    '.ncmpcpp'                         : '',
    '.nvidia-settings-rc'              : '',
    '.pam_environment'                 : '',
    '.profile'                         : '',
    '.recently-used'                   : '',
    '.selected_editor'                 : '',
    '.vim'                             : '',
    '.viminfo'                         : '',
    '.vimrc'                           : '',
    '.Xauthority'                      : '',
    '.Xdefaults'                       : '',
    '.xinitrc'                         : '',
    '.xinputrc'                        : '',
    '.Xresources'                      : '',
    '.zshrc'                           : '',
    '_gvimrc'                          : '',
    '_vimrc'                           : '',
    'a.out'                            : '',
    'authorized_keys'                  : '',
    'bspwmrc'                          : '',
    'cmakelists.txt'                   : '',
    'config'                           : '',
    'config.ac'                        : '',
    'config.m4'                        : '',
    'config.mk'                        : '',
    'config.ru'                        : '',
    'configure'                        : '',
    'docker-compose.yml'               : '',
    'dockerfile'                       : '',
    'Dockerfile'                       : '',
    'dropbox'                          : '',
    'exact-match-case-sensitive-1.txt' : 'X1',
    'exact-match-case-sensitive-2'     : 'X2',
    'favicon.ico'                      : '',
    'gemfile'                          : '',
    'gruntfile.coffee'                 : '',
    'gruntfile.js'                     : '',
    'gruntfile.ls'                     : '',
    'gulpfile.coffee'                  : '',
    'gulpfile.js'                      : '',
    'gulpfile.ls'                      : '',
    'ini'                              : '',
    'known_hosts'                      : '',
    'ledger'                           : '',
    'license'                          : '',
    'LICENSE'                          : '',
    'LICENSE.md'                       : '',
    'LICENSE.txt'                      : '',
    'Makefile'                         : '',
    'makefile'                         : '',
    'Makefile.ac'                      : '',
    'Makefile.in'                      : '',
    'mimeapps.list'                    : '',
    'mix.lock'                         : '',
    'node_modules'                     : '',
    'package-lock.json'                : '',
    'package.json'                     : '',
    'playlists'                        : '',
    'procfile'                         : '',
    'Rakefile'                         : '',
    'rakefile'                         : '',
    'react.jsx'                        : '',
    'README'                           : '',
    'README.markdown'                  : '',
    'README.md'                        : '',
    'README.rst'                       : '',
    'README.txt'                       : '',
    'sxhkdrc'                          : '',
    'user-dirs.dirs'                   : '',
    'webpack.config.js'                : '',
}


def devicon(file):
    if file.is_directory:
        return dir_node_exact_matches.get(file.relative_path, '')
    return file_node_exact_matches.get(os.path.basename(file.relative_path),
                                       file_node_extensions.get(file.extension, ''))
'';

home.file.".config/ranger/plugins/ranger_devicons/__init__.py".text = ''
import os
import ranger.api
from ranger.core.linemode import LinemodeBase
from .devicons import *

SEPARATOR = os.getenv('RANGER_DEVICONS_SEPARATOR', ' ')

@ranger.api.register_linemode
class DevIconsLinemode(LinemodeBase):
  name = "devicons"

  uses_metadata = False

  def filetitle(self, file, metadata):
    return devicon(file) + SEPARATOR + file.relative_path
'';
}
