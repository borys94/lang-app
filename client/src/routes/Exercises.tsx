import {useState, useEffect } from "react";
import {useParams, useNavigate} from "react-router-dom";
import { Button } from "react-bootstrap";
import styled from "styled-components";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark, faPlus } from '@fortawesome/free-solid-svg-icons'

import api from "$services/api";

import AddGrammarExampleModal from "$components/Modals/AddGrammarExample";
import AddExerciseModal from "$components/Modals/Exercises/Add";


import Box from "$components/common/Box";
import Loader from "$components/Loader";

import { useAppSelector } from '$hooks/index';
import LanguageService from "$services/language";

export default function Exercises() {
  const [loading, setLoading] = useState(false);
  const [exercises, setExercises] = useState([] as any)
  const userId = useAppSelector(state => state.user.id)
  
  let params = useParams();
  const navigate = useNavigate();
  useEffect(() => {
    const fetchLesson = async () => {
      setLoading(true);
      const { exercises } = await api.getAllExercises();
      setExercises(exercises)
      setLoading(false);
    }
    fetchLesson();
  }, [])

  const [showModal, setShowModal] = useState(false);
  const [editModal, setEditModal] = useState(false);

  const onAddExercise = () => {
    console.log('add')
  }

  if (loading) {
    return <Loader />
  }

  return (
    <div>
      <LessonHeader>
        <h1>
          Exercises
        </h1>
        <ButtonWrapper>
          <Button onClick={() => setShowModal(true)}>Add example</Button>
          <Button onClick={() => setEditModal(true)}>Edit</Button>
        </ButtonWrapper>
      </LessonHeader>
      {params.grammarId && <AddGrammarExampleModal grammarId={+params.grammarId} show={showModal} close={() => setShowModal(false)} />}
      <AddExerciseModal onSave={onAddExercise} show={editModal} close={() => setEditModal(false)} />
      <div className="row">
        {/* <div dangerouslySetInnerHTML={{__html: grammar.value}} /> */}
      </div>
      <div className="row">
        {exercises.map((exercise: any) => (
          <Box onClick={() => navigate(`/exercises/${exercise.id}`)} key={exercise.id}>{exercise.title}</Box>
        ))}
      </div>
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
