import {useState, useEffect, useRef} from "react";
import styled from "styled-components";

import Button from '@mui/material/Button';
import Paper from '@mui/material/Paper';
import IconButton from '@mui/material/IconButton';
import AddIcon from '@mui/icons-material/Add';
import DeleteIcon from '@mui/icons-material/Delete';
import EditIcon from '@mui/icons-material/Edit';

import { EditGrammarExerciseDialog } from "../Dialogs/EditGrammarExerciseDialog";
import { useAppSelector, useAppDispatch } from '$hooks/index';
import { GrammarExtended, GrammarExercise } from "$types/responses";

import Box from "$components/common/Box";
import Text from "./Text"

interface Props {
  exercise: GrammarExercise;
}

export default function Exercise({
  exercise,
}: Props) {
  const isAdmin = useAppSelector(state => {
    return state.user.role === "admin"
  })


  const [exerciseModal, setExerciseModal] = useState(false);
  const [showResults, setShowResults] = useState(false);
  
  

  const [answers, setAnswers] = useState<string[]>([]);
  const [correctAnswers, setCorrectAnswers] = useState<string[]>([]);
  const [widths, setWidths] = useState<string[]>([]);

  const setAnswer = (index: number, value: string) => {
    answers[index] = value;
    setAnswers([...answers])
  }

  useEffect(() => {
    console.log(exercise.answers)
    setCorrectAnswers(exercise.answers.split(","))
  }, [])

  let i = -1;

  return (
    <Paper sx={{p: 2, my: 2}}>
      <EditGrammarExerciseDialog exercise={exercise} open={exerciseModal} handleClose={() => setExerciseModal(false)} />
      <p>{exercise.name}</p>
      <div>
        {showResults && Text(exercise.value.replaceAll("_", "<v></v>"), (node: any, children: any, index: any) => {
          i++;
          
          return ((ind: number) => {
            const correct = showResults && compare(correctAnswers[ind], answers[ind]);
            const incorrect = showResults && !compare(correctAnswers[ind], answers[ind]) && answers[ind] !== undefined;
            const noAnswer = showResults && answers[ind] === undefined;
            return (
              <>
                {correct && <InputAnswer correct>{correctAnswers[ind]}</InputAnswer>}
                {incorrect && (
                  <>
                    <InputAnswer incorrect>{answers[ind]}</InputAnswer>
                    {" "}
                    <InputAnswer correct>{correctAnswers[ind]}</InputAnswer>
                  </>
                )}
                {noAnswer && (
                  <InputAnswer noAnswer>{correctAnswers[ind]}</InputAnswer>
                )}
              </>
            )
          })(i)
        })}

        {!showResults && Text(exercise.value.replaceAll("_", "<v></v>"), (node: any, children: any, index: any) => {
          i++;
          return ((ind: number) => {
            return <InputWithChangeWidth value={answers[ind] || ""} setValue={(v: any) => setAnswer(ind,v)} />
          })(i)
        })}
      </div>
      <div style={{display: "flex", justifyContent: "space-between"}}>
        <Button variant="contained" color="success" onClick={() => setShowResults(true)}>Check!</Button>
        <div>
          <IconButton>
            <AddIcon />
          </IconButton>
          <IconButton color="primary" onClick={() => setExerciseModal(true)}>
            <EditIcon />
          </IconButton>
          <IconButton color="error">
            <DeleteIcon />
          </IconButton>
        </div>
      </div>

    </Paper>
  );
}


const compare = (a: string, b: string) => {
  const filteredAnswer = (a || "").replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
  const expectedAnswer = (b || "").replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
  return filteredAnswer === expectedAnswer;
}

const InputWithChangeWidth = (props: any) => {
  const [width, setWidth] = useState("");
  const fakeInputRef = useRef<HTMLDivElement>(null);

  const setValue = (e: React.ChangeEvent<HTMLInputElement>) => {
    props.setValue(e.target.value);
    fakeInputRef.current!.innerHTML = e.target.value;
    const width = window.getComputedStyle(fakeInputRef.current!).width;
    setWidth(width);
  }

  return (
    <>
      <FakeInput ref={fakeInputRef} />
      <Input
        width={width}
        value={props.value}
        onChange={setValue}
      />
    </>
  )
}

const FakeInput = styled.div`
  position: absolute;
  left: -9999px;
  font-weight: bold;
  padding: 0 10px;
`;

const Input = styled.input.attrs<any>(({correct, incorrect, value, width}: any) => ({
  
  style: {
    width,
    ...(correct ? {
      backgroundColor: "var(--bs-green)",
      color: "black"
    } : {}),
    ...(incorrect ? {
      backgroundColor: "var(--color-red)",
      color: "black"
    } : {}),
  }
}))<any>`
  min-width: 60px;
  width: 60px;
  height: 24px;
  box-sizing: border-box;
  padding: 0;

  // background-color: var(--bs-info);

  border: none;
  outline: none !important;
  border-bottom: 1px solid black;
  color: var(--color-blue);
  font-weight: bold;
  text-align: center;
`

const InputAnswer = styled.span.attrs<any>(({correct, incorrect, noAnswer}: any) => ({
  style: {
    ...(correct || incorrect || noAnswer ? {
      borderRadius: "4px",
    } : {}),
    ...(correct ? {
      backgroundColor: "var(--bs-green)",
      boxShadow: "0px 0px 6px var(--bs-green)",
    } : {}),
    ...(incorrect ? {
      backgroundColor: "var(--color-red)",
      boxShadow: "0px 0px 6px var(--color-red)",
    } : {}),
    ...(noAnswer ? {
      backgroundColor: "var(--color-yellow)",
      boxShadow: "0px 0px 6px var(--color-yellow)",
    } : {}),
  }
}))<any>`
  font-weight: bold;
`;

const ExerciseContainer = styled.div`
  input {
    border: none;
    outline: none !important;
    width: auto;
    border-bottom: 1px solid black;
    color: var(--color-blue);
    font-weight: bold;
    text-align: center;
    width: 60px;
  }
`;


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