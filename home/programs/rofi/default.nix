{ config, pkgs, ... }:
{
    home.file.".config/rofi/config.rasi".text = ''
/* MACOS LAUNCHPAD LIKE THEME FOR ROFI */
/* Author: Newman Sanchez (https://github.com/newmanls) */

* {
    font: "Montserrat 20";

    bg0:  #24242480;
    bg1:  #363636;
    bg2:  #f5f5f520;
    bg3:  #f5f5f540;
    bg4:  #399a9C4D;

    fg0:  #f5f5f5;
    fg1:  #f5f5f580;

    background-color: transparent;
    text-color:       @fg0;
    padding:          0px;
    margin:           0px;
}

window {
  fullscreen: true;
  padding: 0em;
  background-color: @bg0;
}

mainbox {
  padding: 0px;
}

inputbar {
  background-color: @bg2;

  margin: 10% 25% 6% 25%;
  padding: 10px 0px;

  border: 4px;
  border-radius: 100px;
  border-color: @bg3;

  children: [icon-search,entry];
}

prompt {
  enabled:  false;
}

icon-search {
  expand: false;
  filename: "search";
  vertical-align: 0.5;
}

entry {
  placeholder: "Search";
  placeholder-color: @bg2;
}

listview {
  margin: 0px 10% 15% 10%;
  spacing: 0px 0px 0px 0px;
  columns: 4;
  fixed-columns: true;
}

element, element-text, element-icon {
  cursor: pointer;
}

element {
  padding: 30px 0px 30px 30px;
  orientation: horizontal;
  border-radius: 30px;
}

element selected {
  background-color: @bg4;
}

element-icon {
  padding: 0px 0px 0px 0px;
  size: 4em;
  vertical-align: 0.5;
}

element-text {
  padding: 0px 0px 0px 20px;
  vertical-align: 0.5;
}
    '';
}
