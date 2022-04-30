import { createTheme } from '@mui/material/styles';

import typography from "./base/typography";
import palette from "./base/palette";

import dialog from "./components/dialog";
import paper from "./components/paper";
import list from "./components/list";
import listItemButton from "./components/list/listItemButton";

const theme = createTheme({
  // typography: { ...typography },
  // palette: { 
  //   mode: "dark",
  // },
  components: {
    MuiDialogContent: { ...dialog },
    // MuiPaper: { ...paper },
    // MuiList: { ...list },
    // MuiListItemButton: { ...listItemButton }
  },
});

export default theme;
