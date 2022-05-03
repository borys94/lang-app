import {useState} from "react";
import { styled } from '@mui/material/styles';
import { useNavigate } from "react-router-dom";

import Box from '@mui/material/Box';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemText from '@mui/material/ListItemText';
import LinearProgress, { linearProgressClasses } from '@mui/material/LinearProgress';
import Stack from '@mui/material/Stack';
import AddIcon from '@mui/icons-material/Add';
import IconButton from '@mui/material/IconButton';
import DeleteIcon from '@mui/icons-material/Delete';
import EditIcon from '@mui/icons-material/Edit';

import { DeleteGrammarDialog } from "./Dialogs/DeleteGrammarDialog";
import { EditGrammarDialog } from "./Dialogs/EditGrammarDialog";
import { Grammar } from "$types/responses";

const BorderLinearProgress = styled(LinearProgress)(({ theme }) => ({
  height: 10,
  borderRadius: 5,
  [`&.${linearProgressClasses.colorPrimary}`]: {
    backgroundColor: theme.palette.grey[200],
  },
}));

type Props = {
  grammars: Grammar[];
}

const GrammarList = (props: Props) => {
  const navigate = useNavigate();
  const goToGrammar = (id: number) => {
    navigate(`/grammar/${id}`);
  }

  const openDeleteGrammarDialog = (e: React.MouseEvent<HTMLElement>, grammar: Grammar) => {
    e.stopPropagation();
    setActionGrammar(grammar)
    setDeleteGrammarModal(true);
  }

  const openEditGrammarDialog = (e: React.MouseEvent<HTMLElement>, grammar: Grammar) => {
    e.stopPropagation();
    setActionGrammar(grammar)
    setEditGrammarModal(true);
  }

  const [actionGrammar, setActionGrammar] = useState<Grammar | null>(null);
  const [editGrammarModal, setEditGrammarModal] = useState(false);
  const [deleteGrammarModal, setDeleteGrammarModal] = useState(false);

  return (
    <Box sx={{ width: '100%', bgcolor: 'background.paper' }}>
      <DeleteGrammarDialog
        open={deleteGrammarModal}
        handleClose={() => setDeleteGrammarModal(false)}
        grammar={actionGrammar}
      />
      <EditGrammarDialog
        open={editGrammarModal}
        handleClose={() => setEditGrammarModal(false)}
        grammar={actionGrammar}
      />
      
      <List>
        {props.grammars.map((grammar: Grammar) => {
          // const words = +(props.wordsInLesson.find((word: any) => word.lesson_id === grammar.word_category_id) || {}).count || 0
          // const progress = words / +grammar.words_count * 100
          return (
            <ListItem key={grammar.grammarId} disablePadding>
              <ListItemButton onClick={() => goToGrammar(grammar.grammarId)}>
                <ListItemText primary={grammar.name} />

                <div style={{width: "100px"}}>
                  <BorderLinearProgress color="primary" variant="determinate" value={0} />
                </div>

                <Stack direction="row" spacing={1}>
                  <IconButton color="primary" aria-label="edit" onClick={(e) => openEditGrammarDialog(e, grammar)}>
                    <EditIcon fontSize="small" />
                  </IconButton>
                  <IconButton color="error" aria-label="delete" onClick={(e) => openDeleteGrammarDialog(e, grammar)}>
                    <DeleteIcon fontSize="small" />
                  </IconButton>
                </Stack>
              </ListItemButton>
            </ListItem>
          )
        })}
      </List>
    </Box>
  );
}

export default GrammarList;
