/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

export const THEMES = ['light', 'dark'];

<<<<<<< HEAD
const COLOR_DARK_BG = '#1c1d22';
const COLOR_DARK_BG_DARKER = '#121316';
const COLOR_DARK_TEXT = '#e6f1ff';
=======
const COLORS = {
  DARK: {
    BG_BASE: '#202020',
    BG_SECOND: '#171717',
    BUTTON: '#494949',
    TEXT: '#A4BAD6',
  },
  LIGHT: {
    BG_BASE: '#EEEEEE',
    BG_SECOND: '#FFFFFF',
    BUTTON: 'none',
    TEXT: '#000000',
  },
};
>>>>>>> 80024ddb030... [MIRROR] Refactor Stat Panel styles and more TGUI-like appearance [MDB IGNORE] (#4089)

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

<<<<<<< HEAD
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
      'changelog.background-color': 'none',
      'changelog.text-color': '#202020',
      'changelog.border': 0,
      'rules.background-color': 'none',
      'rules.text-color': '#202020',
      'rules.border': 0,
      'wiki.background-color': '#2ccaff',
      'wiki.text-color': '#202020',
      'wiki.border': 0,
      'forum.background-color': '#none',
      'forum.text-color': '#202020',
      'forum.border': 0,
      'ahelp.background-color': '#f0197d',
      'ahelp.text-color': '#eaeaea',
      'ahelp.border': 0,
      'report-issue.background-color': '#f0197d',
      'report-issue.text-color': '#eaeaea',
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
      'changelog.background-color': '#e6f1ff',
      'changelog.text-color': '#333333',
      'changelog.border': 0,
      'rules.background-color': '#e6f1ff',
      'rules.text-color': '#333333',
      'rules.border': 0,
      'wiki.background-color': '#2ccaff',
      'wiki.text-color': '#333333',
      'wiki.border': 0,
      'forum.background-color': '#e6f1ff',
      'forum.text-color': '#333333',
      'forum.border': 0,
      'webmap.background-color': '#2ccaff',
      'webmap.text-color': '#333333',
      'webmap.border': 0,
      'ahelp.background-color': '#f0197d',
      'ahelp.text-color': '#333333',
      'ahelp.border': 0,
      'report-issue.background-color': '#f0197d',
      'report-issue.text-color': '#333333',
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
=======
  const themeColor = COLORS[name.toUpperCase()];
  if (!themeColor) {
    return;
>>>>>>> 80024ddb030... [MIRROR] Refactor Stat Panel styles and more TGUI-like appearance [MDB IGNORE] (#4089)
  }

  return Byond.winset({
    // Main windows
    'infowindow.background-color': themeColor.BG_BASE,
    'infowindow.text-color': themeColor.TEXT,
    'info.background-color': themeColor.BG_BASE,
    'info.text-color': themeColor.TEXT,
    'browseroutput.background-color': themeColor.BG_BASE,
    'browseroutput.text-color': themeColor.TEXT,
    'outputwindow.background-color': themeColor.BG_BASE,
    'outputwindow.text-color': themeColor.TEXT,
    'mainwindow.background-color': themeColor.BG_BASE,
    'split.background-color': themeColor.BG_BASE,
    // Buttons
    'changelog.background-color': themeColor.BUTTON,
    'changelog.text-color': themeColor.TEXT,
    'rules.background-color': themeColor.BUTTON,
    'rules.text-color': themeColor.TEXT,
    'wiki.background-color': themeColor.BUTTON,
    'wiki.text-color': themeColor.TEXT,
    'forum.background-color': themeColor.BUTTON,
    'forum.text-color': themeColor.TEXT,
    'github.background-color': themeColor.BUTTON,
    'github.text-color': themeColor.TEXT,
    'report-issue.background-color': themeColor.BUTTON,
    'report-issue.text-color': themeColor.TEXT,
    'fullscreen-toggle.background-color': themeColor.BUTTON,
    'fullscreen-toggle.text-color': themeColor.TEXT,
    // Status and verb tabs
    'output.background-color': themeColor.BG_BASE,
    'output.text-color': themeColor.TEXT,
    // Say, OOC, me Buttons etc.
    'saybutton.background-color': themeColor.BG_BASE,
    'saybutton.text-color': themeColor.TEXT,
    'oocbutton.background-color': themeColor.BG_BASE,
    'oocbutton.text-color': themeColor.TEXT,
    'mebutton.background-color': themeColor.BG_BASE,
    'mebutton.text-color': themeColor.TEXT,
    'asset_cache_browser.background-color': themeColor.BG_BASE,
    'asset_cache_browser.text-color': themeColor.TEXT,
    'tooltip.background-color': themeColor.BG_BASE,
    'tooltip.text-color': themeColor.TEXT,
    'input.background-color': themeColor.BG_SECOND,
    'input.text-color': themeColor.TEXT,
  });
};
