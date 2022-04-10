import {useState, useEffect} from "react";
import { Button } from "react-bootstrap";
import styled from "styled-components";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark, faPlus } from '@fortawesome/free-solid-svg-icons'

import api from "$services/api";

import AddExerciseModal from "$components/Modals/AddExercise";
import AddSubExerciseModal from "$components/Modals/AddSubExercise";
import EditSubExerciseModal from "$components/Modals/EditSubExercise";
import EditExerciseModal from "$components/Modals/EditExercise";

import Box from "$components/common/Box";

interface Props {
  grammar: any;
}

export default function Grammar({
  grammar,
}: Props) {
  const [exercises, setExercises] = useState([] as any)
  
  useEffect(() => {
    const fetchLesson = async () => {
      const { exercises } = await api.getExercises(grammar.grammar_id);
      setExercises(exercises);
    }
    fetchLesson();
  }, [])

  const [exerciseModal, setExerciseModal] = useState(false);
  const [subExerciseModal, setSubExerciseModal] = useState(false);
  const [editSubExerciseModal, setEditSubExerciseModal] = useState(false);
  const [editExerciseModal, setEditExerciseModal] = useState(false);
  const [selectedExercise, setSelectedExercise] = useState({} as any);
  const [selectedSubExercise, setSelectedSubExercise] = useState({} as any);

  const onEditSubExerciseClick = (exercise: any, subExercise: any) => {
    setEditSubExerciseModal(true);
    setSelectedSubExercise(subExercise);
    setSelectedExercise(exercise);
  }

  const onEditExerciseClick = (exercise: any) => {
    setEditExerciseModal(true);
    setSelectedExercise(exercise);
  }

  return (
    <div>
      <Button onClick={() => setExerciseModal(true)}>Add exercise</Button>
      <AddExerciseModal grammar={grammar} show={exerciseModal} close={() => setExerciseModal(false)} />
      <AddSubExerciseModal exercise={selectedExercise} grammar={grammar} show={subExerciseModal} close={() => setSubExerciseModal(false)} />
      <EditSubExerciseModal subExercise={selectedSubExercise} exercise={selectedExercise} grammar={grammar} show={editSubExerciseModal} close={() => setEditSubExerciseModal(false)} />
      <EditExerciseModal exercise={selectedExercise} grammar={grammar} show={editExerciseModal} close={() => setEditExerciseModal(false)} />
      {/* <RemoveSubExerciseModal subExercise={selectedSubExercise} exercise={selectedExercise} grammar={grammar} show={editSubExerciseModal} close={() => setEditSubExerciseModal(false)} /> */}
      <div className="row">
        {exercises.map((exercise: any) => (
          <Box key={exercise.exercise_id}>
            <AddExerciseButton onClick={() => {
              setSubExerciseModal(true);
              setSelectedExercise(exercise);
            }}>
              <FontAwesomeIcon icon={faPlus} />
            </AddExerciseButton>
            <div>
              <b>
                {exercise.name} {" "}
                <EditSubExercise onClick={() => onEditExerciseClick(exercise)}>
                  Edit
                </EditSubExercise>
              </b>
              <ol>
                {exercise.subExercises.map((subExercise: any) => (
                  <li key={subExercise.sub_exercise_id}>
                    {subExercise.value} {" "}
                    <EditSubExercise onClick={() => onEditSubExerciseClick(exercise, subExercise)}>
                      Edit
                    </EditSubExercise>
                  </li>
                ))}
              </ol>
            </div>
          </Box>
        ))}
      </div>
    </div>
  );
}

const EditSubExercise = styled.span`
  font-weight: bold;
  color: var(--color-blue);

  :hover {
    text-decoration: underline;
  }
`;

const AddExerciseButton = styled.div`
  position: absolute;
  right: 10px;
  top: 10px;
  
`