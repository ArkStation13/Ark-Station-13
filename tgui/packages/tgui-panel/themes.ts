/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

export const THEMES = ['light', 'dark'];

const COLOR_DARK_BG = '#1c1d22';
const COLOR_DARK_BG_DARKER = '#121316';
const COLOR_DARK_TEXT = '#e6f1ff';

let setClientThemeTimer: NodeJS.Timeout;

/**
 * Darkmode preference, originally by Kmc2000.
 *
 * This lets you switch client themes by using winset.
 *
 * If you change ANYTHING in interface/skin.dmf you need to change it here.
 *
 * There's no way round it. We're essentially changing the skin by hand.
 * It's painful but it works, and is the way Lummox suggested.
 */
export const setClientTheme = (name) => {
  // Transmit once for fast updates and again in a little while in case we won
  // the race against statbrowser init.
  clearInterval(setClientThemeTimer);
  Byond.command(`.output statbrowser:set_theme ${name}`);
  setClientThemeTimer = setTimeout(() => {
    Byond.command(`.output statbrowser:set_theme ${name}`);
  }, 1500);

  if (name === 'light') {
    return Byond.winset({
      // Main windows
      'infowindow.background-color': 'none',
      'infowindow.text-color': '#202020',
      'info.background-color': 'none',
      'info.text-color': '#202020',
      'browseroutput.background-color': 'none',
      'browseroutput.text-color': '#202020',
      'outputwindow.background-color': 'none',
      'outputwindow.text-color': '#202020',
      'mainwindow.background-color': 'none',
      'split.background-color': 'none',
      // Buttons
      'changelog.background-color': '#90c985',
      'changelog.text-color': '#202020',
      'changelog.border': 0,
      'rules.background-color': '#90c985',
      'rules.text-color': '#202020',
      'rules.border': 0,
      'wiki.background-color': '#90c985',
      'wiki.text-color': '#202020',
      'wiki.border': 0,
      'forum.background-color': '#90c985',
      'forum.text-color': '#202020',
      'forum.border': 0,
      'ahelp.background-color': '#90c985',
      'ahelp.text-color': '#202020',
      'ahelp.border': 0,
      'report-issue.background-color': '#90c985',
      'report-issue.text-color': '#202020',
      'report-issue.border': 0,
      // Status and verb tabs
      'output.background-color': 'none',
      'output.text-color': '#202020',
      'statwindow.background-color': 'none',
      'statwindow.text-color': '#202020',
      'stat.background-color': '#eaeaea',
      'stat.tab-background-color': 'none',
      'stat.text-color': '#202020',
      'stat.tab-text-color': '#202020',
      'stat.prefix-color': '#202020',
      'stat.suffix-color': '#202020',
      // Say, OOC, me Buttons etc.
      'saybutton.background-color': 'none',
      'saybutton.text-color': '#202020',
      'oocbutton.background-color': 'none',
      'oocbutton.text-color': '#202020',
      'mebutton.background-color': 'none',
      'mebutton.text-color': '#202020',
      'asset_cache_browser.background-color': 'none',
      'asset_cache_browser.text-color': '#202020',
      'tooltip.background-color': 'none',
      'tooltip.text-color': '#202020',
      'input.background-color': '#eaeaea',
      'input.text-color': '#202020',
    });
  }
  if (name === 'dark') {
    Byond.winset({
      // Main windows
      'infowindow.background-color': COLOR_DARK_BG,
      'infowindow.text-color': COLOR_DARK_TEXT,
      'info.background-color': COLOR_DARK_BG,
      'info.text-color': COLOR_DARK_TEXT,
      'browseroutput.background-color': COLOR_DARK_TEXT,
      'browseroutput.text-color': COLOR_DARK_TEXT,
      'outputwindow.background-color': COLOR_DARK_BG,
      'outputwindow.text-color': COLOR_DARK_TEXT,
      'mainwindow.background-color': COLOR_DARK_BG,
      'split.background-color': COLOR_DARK_BG,
      // Buttons
      'changelog.background-color': '#425142',
      'changelog.text-color': '#c9c9c9',
      'changelog.border': 0,
      'rules.background-color': '#425142',
      'rules.text-color': '#c9c9c9',
      'rules.border': 0,
      'wiki.background-color': '#425142',
      'wiki.text-color': '#c9c9c9',
      'wiki.border': 0,
      'forum.background-color': '#425142',
      'forum.text-color': '#c9c9c9',
      'forum.border': 0,
      'ahelp.background-color': '#425142',
      'ahelp.text-color': '#c9c9c9',
      'ahelp.border': 0,
      'report-issue.background-color': '#425142',
      'report-issue.text-color': '#c9c9c9',
      'report-issue.border': 0,
      // Status and verb tabs
      'output.background-color': COLOR_DARK_BG_DARKER,
      'output.text-color': COLOR_DARK_TEXT,
      'statwindow.background-color': COLOR_DARK_BG_DARKER,
      'statwindow.text-color': COLOR_DARK_TEXT,
      'stat.background-color': COLOR_DARK_BG_DARKER,
      'stat.tab-background-color': COLOR_DARK_BG,
      'stat.text-color': COLOR_DARK_TEXT,
      'stat.tab-text-color': COLOR_DARK_TEXT,
      'stat.prefix-color': COLOR_DARK_TEXT,
      'stat.suffix-color': COLOR_DARK_TEXT,
      // Say, OOC, me Buttons etc.
      'saybutton.background-color': '#a4bad6',
      'saybutton.text-color': COLOR_DARK_BG_DARKER,
      'oocbutton.background-color': '#cca300',
      'oocbutton.text-color': COLOR_DARK_BG_DARKER,
      'mebutton.background-color': '#5975da',
      'mebutton.text-color': COLOR_DARK_BG_DARKER,
      'asset_cache_browser.background-color': COLOR_DARK_BG,
      'asset_cache_browser.text-color': COLOR_DARK_TEXT,
      'tooltip.background-color': COLOR_DARK_BG,
      'tooltip.text-color': COLOR_DARK_TEXT,
      'input.background-color': '#25272d',
      'input.text-color': '#eaeaea',
    });
  }
};
