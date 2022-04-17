import {useState, useEffect} from "react";
import {useParams} from "react-router-dom";
import { Button } from "react-bootstrap";
import styled from "styled-components";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark, faPlus } from '@fortawesome/free-solid-svg-icons'

import api from "$services/api";

import SubExercise from "$components/Exercises/SubExercise";
import AddSubExerciseModal from "$components/Modals/Exercises/AddSubExercise";
import EditSubExerciseModal from "$components/Modals/Exercises/EditSubExercise";


import Box from "$components/common/Box";
import Loader from "$components/Loader";

import { useAppSelector } from '$hooks/index';
import LanguageService from "$services/language";

export default function Exercises() {
  const [loading, setLoading] = useState(true);
  const [exercise, setExercise] = useState([] as any);
  const [subExercise, setSubExercise] = useState(null as any);
  const userId = useAppSelector(state => state.user.id)
  
  let params = useParams();
  useEffect(() => {
    const fetchLesson = async () => {
      if (params.exerciseId && params.subExerciseId) {
        setLoading(true);
        const { subExercise } = await api.getSubExercise(params.exerciseId, params.subExerciseId);
        console.log(subExercise)
        setSubExercise(subExercise)
        setLoading(false);
      }
    }
    fetchLesson();
  }, [])

  const [addExerciseModal, setAddExerciseModal] = useState(false);
  const [editSubExerciseModal, setEditSubExerciseModal] = useState(false);
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
        <h3>
          {subExercise.title}
        </h3>
        <ButtonWrapper>
          <Button onClick={() => setEditSubExerciseModal(true)}>Edit</Button>
        </ButtonWrapper>
      </LessonHeader>
      <EditSubExerciseModal onSave={() => {}} subExercise={subExercise} show={editSubExerciseModal} close={() => setEditSubExerciseModal(false)} />
      {params.exerciseId && <AddSubExerciseModal onSave={() => {}} exerciseId={params.exerciseId} show={addExerciseModal} close={() => setAddExerciseModal(false)} />}
      {/* <AddExerciseModal onSave={onAddExercise} show={editModal} close={() => setEditModal(false)} /> */}
      <div className="row">
        <div dangerouslySetInnerHTML={{__html: subExercise.title}} />
      </div>
      <div className="row">
        <SubExercise subExercise={subExercise} />
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
