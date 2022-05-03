import {useState, useEffect} from "react";
import { useNavigate } from "react-router-dom";
import styled from "@emotion/styled";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import IconButton from '@mui/material/IconButton';
import AddIcon from '@mui/icons-material/Add';

import { useAppSelector, useAppDispatch } from '$hooks/index';
import { AddLessonDialog } from "$components/WordCategories/AddWordCategoryDialog";
import AddGrammarModal from "$components/Modals/AddGrammar";
import LessonLevelDropdown from "$components/LessonLevelDropdown";
import Box from "$components/common/Box";
import Loader from "$components/Loader";
import LessonsList from "$components/WordCategories/WordCategoriesList";

import LanguageService from "$services/language";
import { setLessons } from "$stores/lessons";

import api from "$services/api";
import LevelService, { LevelType } from "$services/level";
import useRequest from "$hooks/useRequest";

const Container = styled.div`
  width: 100%;
`

export default function WordCategories() {
  const navigate = useNavigate();
  const dispatch = useAppDispatch();

  const [doRequest, errors] = useRequest({
    url: `/api/api/words/categories?lang=${LanguageService.get()}`,
    method: 'get',
    body: {},
    onSuccess: (data) => {
      dispatch(setLessons(data))
      // props.handleClose();
    }
  });

  const lessons = useAppSelector(state => {
    return state.lessons.lessons;
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
      doRequest();
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
    </Container>
  );
}