import {useState, useEffect} from "react";
import {useParams} from "react-router-dom";
import styled from "styled-components";
import Stack from '@mui/material/Stack';
import EditIcon from '@mui/icons-material/Edit';
import IconButton from '@mui/material/IconButton';
import DeleteIcon from '@mui/icons-material/Delete';

import api from "$services/api";

import AddGrammarExampleModal from "$components/Modals/AddGrammarExample";
import EditGrammarModal from "$components/Modals/EditGrammar";

import Exercises from "$components/GrammarExercises";
import { DeleteGrammarDialog } from "./Dialogs/DeleteGrammarDialog";
import { EditGrammarDialog } from "./Dialogs/EditGrammarDialog";

import Box from "$components/common/Box";
import Loader from "$components/Loader";

import {Lesson, Vocabulary, Sentences} from "$types/lessons";
import { useAppSelector } from '$hooks/index';
import useRequest from "$hooks/useRequest";
import LanguageService from "$services/language";
import { GrammarExtended } from "$types/responses";

export default function Grammar() {
  const [loading, setLoading] = useState(false);
  const [grammar, setGrammar] = useState<GrammarExtended | null>(null)
  const [actionGrammar, setActionGrammar] = useState<GrammarExtended | null>(null);
  const [editGrammarModal, setEditGrammarModal] = useState(false);
  const [deleteGrammarModal, setDeleteGrammarModal] = useState(false);
  
  let params = useParams();

  const [doRequest, errors] = useRequest({
    url: `/api/api/grammar/${params.grammarId}?lang=${LanguageService.get()}`,
    method: 'get',
    body: {},
    onSuccess: (data) => {
      setGrammar(data);
      // props.handleClose();
    }
  });

  useEffect(() => {
    const fetchLesson = async () => {
      if (params.grammarId) {
        setLoading(true);
        doRequest();
        setLoading(false);
      }
    }
    fetchLesson();
  }, [])

  const openDeleteGrammarDialog = (e: React.MouseEvent<HTMLElement>, grammar: GrammarExtended) => {
    e.stopPropagation();
    setActionGrammar(grammar)
    setDeleteGrammarModal(true);
  }

  const openEditGrammarDialog = (e: React.MouseEvent<HTMLElement>, grammar: GrammarExtended) => {
    e.stopPropagation();
    setActionGrammar(grammar)
    setEditGrammarModal(true);
  }

  const [showModal, setShowModal] = useState(false);
  const [editModal, setEditModal] = useState(false);

  const [lesson, setLesson] = useState({
    lesson: {} as Lesson,
    vocabulary: [] as Vocabulary,
    sentences: [] as Sentences,
  });

  if (!grammar) {
    return <Loader />
  }

  return (
    <div>
      <LessonHeader>
        <h1>
          {grammar.name} / {grammar.level}
        </h1>
        <Stack direction="row" spacing={1}>
          <IconButton color="primary" aria-label="edit" onClick={(e) => openEditGrammarDialog(e, grammar)}>
            <EditIcon fontSize="large" />
          </IconButton>
          <IconButton color="error" aria-label="delete" onClick={(e) => openDeleteGrammarDialog(e, grammar)}>
            <DeleteIcon fontSize="large" />
          </IconButton>
        </Stack>
      </LessonHeader>
      {params.grammarId && <AddGrammarExampleModal grammarId={+params.grammarId} show={showModal} close={() => setShowModal(false)} />}
      {/* {params.grammarId && <EditGrammarModal onSave={onGrammarSave} grammar={grammar} show={editModal} close={() => setEditModal(false)} />} */}
      <div className="row">
        <div dangerouslySetInnerHTML={{__html: grammar.value}} />
      </div>
      {grammar && grammar.grammarId && <Exercises grammar={grammar} />}

      <DeleteGrammarDialog
        open={deleteGrammarModal}
        handleClose={() => setDeleteGrammarModal(false)}
        grammar={grammar}
      />
      <EditGrammarDialog
        open={editGrammarModal}
        handleClose={() => setEditGrammarModal(false)}
        grammar={grammar}
      />
    </div>
  );
}

const ButtonWrapper = styled.div`
  button {
    margin-left: 10px;
  }
`;

const LessonHeader = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 10px 0;
`;

const RemoveWord = styled.div`
  position: absolute;
  right: 10px;
`

const AddWord = styled.div`
  position: absolute;
  right: 10px;
`;
