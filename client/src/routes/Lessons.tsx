import {useState, useEffect} from "react";
import { useNavigate } from "react-router-dom";
import styled from "@emotion/styled";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import IconButton from '@mui/material/IconButton';
import AddIcon from '@mui/icons-material/Add';

import { useAppSelector, useAppDispatch } from '$hooks/index';
import { AddLessonDialog } from "$components/Lessons/AddLessonDialog";
import AddGrammarModal from "$components/Modals/AddGrammar";
import LessonLevelDropdown from "$components/LessonLevelDropdown";
import Box from "$components/common/Box";
import Loader from "$components/Loader";
import LessonsList from "$components/Lessons/LessonsList";
import AdminWords from "$components/Admin/Words";

import LanguageService from "$services/language";
import { setLessons } from "$stores/lessons";
import { setGrammars} from "$stores/grammars";

import api from "$services/api";
import LevelService, { LevelType } from "$services/level";

const Container = styled.div`
  width: 100%;
`

export default function Lessons() {
  const navigate = useNavigate();
  const dispatch = useAppDispatch();

  const lessons = useAppSelector(state => {
    return state.lessons.lessons;
  });

  const grammars = useAppSelector(state => {
    return state.grammars.grammars;
  });

  const goToLesson = (id: number) => {
    navigate(`/lessons/${id}`);
  }

  const goToGrammar = (id: number) => {
    navigate(`/grammar/${id}`);
  }

  useEffect(() => {
    const fetchLessons = async () => {
      setLoading(true);
      const data = await api.getWordsInLessons();
      const { lessons } = await api.getLessons(LanguageService.get());
      const { grammars } = await api.getGrammars(LanguageService.get());
      dispatch(setLessons(lessons))
      dispatch(setGrammars(grammars))
      setWordsInLesson(data)
      setLoading(false);
    }

    fetchLessons();
  }, [])

  const [loading, setLoading] = useState(false);
  const [showModal, setShowModal] = useState(false);
  const [addGrammarModal, setAddGrammarModal] = useState(false);
  
  const [wordsInLesson, setWordsInLesson] = useState([] as any);
  const [level, setLevel] = useState(LevelService.get() as LevelType);

  if (loading) {
    return <Loader />
  }

  return (
    <Container>
      <Stack direction="row" spacing={1} justifyContent="space-between" alignItems="center">
        <LessonLevelDropdown level={level} setLevel={setLevel}/>
        <span>
          <IconButton aria-label="add" onClick={() => setShowModal(true)}>
            <AddIcon />
          </IconButton>
        </span>
      </Stack>
      {/* <Button variant="contained" color="primary" onClick={() => setShowModal(true)}>Add lesson</Button> */}
        
      <AddLessonDialog open={showModal} handleClose={() => setShowModal(false)} />
      <AddGrammarModal show={addGrammarModal} close={() => setAddGrammarModal(false)} />
      <div className="row">
        <LessonsList lessons={lessons.filter(lesson => lesson.level === level)} wordsInLesson={wordsInLesson} />
      </div>
      <h2>Grammar</h2>
      <Button onClick={() => setAddGrammarModal(true)}>Add grammar</Button>
      <div className="row">
        {grammars.filter(grammar => grammar.level === level).map((grammar: any) => (
          <div className="col-md-6 col-lg-4" key={grammar.grammar_id} onClick={() => goToGrammar(grammar.grammar_id)}>
            <Box>
              <span style={{marginRight: "10px"}}>{grammar.name}</span><b>{grammar.level}</b>
            </Box>
          </div>
        ))}
      </div>
      
    </Container>
  );
}