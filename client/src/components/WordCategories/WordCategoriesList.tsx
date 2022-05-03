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

const BorderLinearProgress = styled(LinearProgress)(({ theme }) => ({
  height: 10,
  borderRadius: 5,
  [`&.${linearProgressClasses.colorPrimary}`]: {
    backgroundColor: theme.palette.grey[200],
  },
}));

type Props = {
  lessons: any;
  wordsInLesson: any;
}

const LessonsList = (props: Props) => {
  const navigate = useNavigate();
  const goToLesson = (id: number) => {
    navigate(`/lessons/${id}`);
  }
  return (
    <Box sx={{ width: '100%', bgcolor: 'background.paper' }}>
      <List>
        {props.lessons.map((lesson: any) => {
          const words = +(props.wordsInLesson.find((word: any) => word.lesson_id === lesson.word_category_id) || {}).count || 0
          const progress = words / +lesson.words_count * 100
          return (
            <ListItem key={lesson.word_category_id} disablePadding>
              <ListItemButton onClick={() => goToLesson(lesson.word_category_id)}>
                <ListItemText primary={lesson.name} />

                <div style={{width: "100px"}}>
                  <BorderLinearProgress color={progress >= 100 ? "success" : "primary"} variant="determinate" value={progress} />
                </div>

                <div style={{width: "70px", textAlign: "left", paddingLeft: "10px"}}>{words} / {lesson.words_count}</div>
                <Stack direction="row" spacing={1}>
                  <IconButton aria-label="add">
                    <AddIcon fontSize="small" />
                  </IconButton>
                  <IconButton color="primary" aria-label="edit">
                    <EditIcon fontSize="small" />
                  </IconButton>
                  <IconButton color="error" aria-label="delete">
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

export default LessonsList;

