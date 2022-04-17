import {useState, useEffect, useRef} from "react";
import { Button } from "react-bootstrap";
import styled from "styled-components";

import htmlToReact from "html-to-react"
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark, faPlus } from '@fortawesome/free-solid-svg-icons'

import api from "$services/api";
import stringToReact from "$services/stringToReact";
import { useAppSelector, useAppDispatch } from '$hooks/index';


import Box from "$components/common/Box";
import Text from "./Text"

interface Props {
  subExercise: any;
}

export default function SubExercise({
  subExercise,
}: Props) {
  const isAdmin = useAppSelector(state => {
    return state.user.role === "admin"
  })


  const [solveMode, setSolveMode] = useState(false);
  const [points, setPoints] = useState(0);
  const [showResults, setShowResults] = useState(false);
  
  

  const [answers, setAnswers] = useState<string[]>([]);
  const [widths, setWidths] = useState<string[]>([]);

  const setAnswer = (index: number, value: string) => {
    answers[index] = value;
    setAnswers([...answers])
  }

  let i = -1;

  return (
    <div>
      <Button variant="success" onClick={() => setShowResults(true)}>Check!</Button>
      <div className="row">
        <Box hoverable={false} key={subExercise.sub_exercise_id}>
          <div>
            {showResults && Text(subExercise.text.replaceAll("_", "<v></v>"), (node: any, children: any, index: any) => {
              i++;
              
              return ((ind: number) => {
                const correct = showResults && compare(subExercise.answers[ind], answers[ind]);
                const incorrect = showResults && !compare(subExercise.answers[ind], answers[ind]) && answers[ind] !== undefined;
                const noAnswer = showResults && answers[ind] === undefined;
                return (
                  <>
                    {correct && <InputAnswer correct>{subExercise.answers[ind]}</InputAnswer>}
                    {incorrect && (
                      <>
                        <InputAnswer incorrect>{answers[ind]}</InputAnswer>
                        {" "}
                        <InputAnswer correct>{subExercise.answers[ind]}</InputAnswer>
                      </>
                    )}
                    {noAnswer && (
                      <InputAnswer noAnswer>{subExercise.answers[ind]}</InputAnswer>
                    )}
                  </>
                )
              })(i)
            })}

            {!showResults && Text(subExercise.text.replaceAll("_", "<v></v>"), (node: any, children: any, index: any) => {
              i++;
              return ((ind: number) => {
                return <InputWithChangeWidth value={answers[ind] || ""} setValue={(v: any) => setAnswer(ind,v)} />
              })(i)
            })}
          </div>
        </Box>
      </div>
    </div>
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