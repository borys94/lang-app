import {useState, useEffect} from "react";
import { useNavigate } from "react-router-dom";
import styled from "@emotion/styled";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import IconButton from '@mui/material/IconButton';
import AddIcon from '@mui/icons-material/Add';

import { useAppSelector, useAppDispatch } from '$hooks/index';
import { AddGrammarDialog } from "./Dialogs/AddGrammarDialog";
import LessonLevelDropdown from "$components/LessonLevelDropdown";
import Box from "$components/common/Box";
import Loader from "$components/Loader";
import GrammarList from "./GrammarList";

import LanguageService from "$services/language";
import { setGrammarList} from "$stores/grammars";

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
    url: `/api/api/grammar?lang=${LanguageService.get()}`,
    method: 'get',
    body: {},
    onSuccess: (data) => {
      dispatch(setGrammarList(data))
      // setGrammars(data);
      // props.handleClose();
    }
  });

  const lessons = useAppSelector(state => {
    return state.lessons.lessons;
  });

  const grammarList = useAppSelector(state => {
    return state.grammars.grammarList;
  });

  const goToLesson = (id: number) => {
    navigate(`/lessons/${id}`);
  }

  const goToGrammar = (id: number) => {
    navigate(`/grammar/${id}`);
  }

  useEffect(() => {
    const fetchGrammar = async () => {
      setLoading(true);
      doRequest();
      setLoading(false);
    }

    fetchGrammar();
  }, [])

  const [loading, setLoading] = useState(false);
  // const [grammar, setGrammar] = useState<any>([]);
  const [showModal, setShowModal] = useState(false);
  const [addGrammarModal, setAddGrammarModal] = useState(false);
  
  const [wordsInLesson, setWordsInLesson] = useState([] as any);
  const [level, setLevel] = useState(LevelService.get() as LevelType);

  if (loading) {
    return <Loader />
  }

  return (
    <Container>
      <h2>Grammar</h2>
      <Stack direction="row" spacing={1} justifyContent="space-between" alignItems="center">
        <LessonLevelDropdown level={level} setLevel={setLevel}/>
        <span>
          <IconButton aria-label="add" onClick={() => setAddGrammarModal(true)}>
            <AddIcon />
          </IconButton>
        </span>
      </Stack>
      {/* <Button variant="contained" color="primary" onClick={() => setShowModal(true)}>Add lesson</Button> */}
      <AddGrammarDialog open={addGrammarModal} handleClose={() => setAddGrammarModal(false)} />
      {/* <AddGrammarModal show={addGrammarModal} close={() => setAddGrammarModal(false)} /> */}
      <div className="row">
        <GrammarList grammars={grammarList.filter((lesson: any) => lesson.level === level)} />
      </div>
      
    </Container>
  );
}