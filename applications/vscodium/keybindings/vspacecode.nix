{ config, pkgs, ... }:

{
programs.vscode.keybindings = [
  {
    key = "space";
    command = "vspacecode.space";
    when = "activeEditorGroupEmpty && focusedView == '' && !whichkeyActive && !inputFocus";
  },
  {
    key = "space";
    command = "vspacecode.space";
    when = "sideBarFocus && !inputFocus && !whichkeyActive";
  },
  {
    key = "tab";
    command = "extension.vim_tab";
    when = "editorFocus && vim.active && !inDebugRepl && vim.mode != 'Insert' && editorLangId != 'magit'";
  },
  {
    key = "tab";
    command = "-extension.vim_tab";
    when = "editorFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'";
  },
  {
    key = "x";
    command = "magit.discard-at-point";
    when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
  },
  {
    key = "k";
    command = "-magit.discard-at-point";
  },
  {
    key = "-";
    command = "magit.reverse-at-point";
    when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
  },
  {
    key = "v";
    command = "-magit.reverse-at-point";
  },
  {
    key = "shift+-";
    command = "magit.reverting";
    when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
  },
  {
    key = "shift+v";
    command = "-magit.reverting";
  },
  {
    key = "shift+o";
    command = "magit.resetting";
    when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
  },
  {
    key = "shift+x";
    command = "-magit.resetting";
  },
  {
    key = "x";
    command = "-magit.reset-mixed";
  },
  {
    key = "ctrl+u x";
    command = "-magit.reset-hard";
  },
  {
    key = "y";
    command = "-magit.show-refs";
  },
  {
    key = "y";
    command = "vspacecode.showMagitRefMenu";
    when = "editorTextFocus && editorLangId == 'magit' && vim.mode == 'Normal'";
  },
  {
    key = "ctrl+j";
    command = "workbench.action.quickOpenSelectNext";
    when = "inQuickOpen";
  },
  {
    key = "ctrl+k";
    command = "workbench.action.quickOpenSelectPrevious";
    when = "inQuickOpen";
  },
  {
    key = "ctrl+j";
    command = "selectNextSuggestion";
    when = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
  },
  {
    key = "ctrl+k";
    command = "selectPrevSuggestion";
    when = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
  },
  {
    key = "ctrl+l";
    command = "acceptSelectedSuggestion";
    when = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
  },
  {
    key = "ctrl+j";
    command = "showNextParameterHint";
    when = "editorFocus && parameterHintsMultipleSignatures && parameterHintsVisible";
  },
  {
    key = "ctrl+k";
    command = "showPrevParameterHint";
    when = "editorFocus && parameterHintsMultipleSignatures && parameterHintsVisible";
  },
  {
    key = "ctrl+j";
    command = "selectNextCodeAction";
    when = "codeActionMenuVisible";
  },
  {
    key = "ctrl+k";
    command = "selectPrevCodeAction";
    when = "codeActionMenuVisible";
  },
  {
    key = "ctrl+l";
    command = "acceptSelectedCodeAction";
    when = "codeActionMenuVisible";
  },
  {
    key = "ctrl+h";
    command = "file-browser.stepOut";
    when = "inFileBrowser";
  },
  {
    key = "ctrl+l";
    command = "file-browser.stepIn";
    when = "inFileBrowser";
  }
]
}