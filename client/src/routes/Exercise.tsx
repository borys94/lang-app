import {useState, useEffect} from "react";
import {useParams, useNavigate} from "react-router-dom";
import { Button } from "react-bootstrap";
import styled from "styled-components";

import api from "$services/api";

import AddGrammarExampleModal from "$components/Modals/AddGrammarExample";
import AddSubExerciseModal from "$components/Modals/Exercises/AddSubExercise";


import Box from "$components/common/Box";
import Loader from "$components/Loader";

import { useAppSelector } from '$hooks/index';
import LanguageService from "$services/language";

export default function Exercises() {
  const [loading, setLoading] = useState(false);
  const [exercise, setExercise] = useState([] as any);
  const [subExercises, setSubExercises] = useState([] as any);
  const userId = useAppSelector(state => state.user.id)
  
  let params = useParams();
  let navigate = useNavigate();
  useEffect(() => {
    const fetchLesson = async () => {
      if (params.exerciseId) {
        setLoading(true);
        const { exercise } = await api.getExercise(params.exerciseId);
        const { subExercises } = await api.getSubExercises(params.exerciseId);
        setExercise(exercise)
        setSubExercises(subExercises)
        setLoading(false);
      }
    }
    fetchLesson();
  }, [])

  const [addExerciseModal, setAddExerciseModal] = useState(false);
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
          {exercise.title}
        </h1>
        <ButtonWrapper>
          <Button onClick={() => setAddExerciseModal(true)}>Add exercise</Button>
          <Button onClick={() => setEditModal(true)}>Edit</Button>
        </ButtonWrapper>
      </LessonHeader>
      {params.exerciseId && <AddSubExerciseModal onSave={() => {}} exerciseId={params.exerciseId} show={addExerciseModal} close={() => setAddExerciseModal(false)} />}
      {/* <AddExerciseModal onSave={onAddExercise} show={editModal} close={() => setEditModal(false)} /> */}
      <div className="row">
        {/* <div dangerouslySetInnerHTML={{__html: grammar.value}} /> */}
      </div>
      <div className="row">
        {subExercises.map((subExercise: any) => (
          <Box
            onClick={() => navigate(`/exercises/${subExercise.exerciseId}/subExercise/${subExercise.id}`)}
            key={subExercise.id}
          >
            {subExercise.title}
          </Box>
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
