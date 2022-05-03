import {useState, useEffect, useRef} from "react";

import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import AddIcon from '@mui/icons-material/Add';

import styled from "styled-components";
import { useAppSelector, useAppDispatch } from '$hooks/index';

import { AddGrammarExerciseDialog } from "./Dialogs/AddGrammarExerciseDialog";
import AddSubExerciseModal from "$components/Modals/AddSubExercise";
import EditSubExerciseModal from "$components/Modals/EditSubExercise";
import EditExerciseModal from "$components/Modals/EditExercise";
import Box from "$components/common/Box";
import Exercise from "./ExerciseList/Exercise"
import { GrammarExtended, GrammarExercise } from "$types/responses";

interface Props {
  grammar: GrammarExtended;
}

export default function Grammar({
  grammar,
}: Props) {
  const isAdmin = useAppSelector(state => {
    return state.user.role === "admin"
  });

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
      {isAdmin && (
        <IconButton onClick={() => setExerciseModal(true)}>
          <AddIcon />
        </IconButton>
      )}
      <AddGrammarExerciseDialog grammar={grammar} open={exerciseModal} handleClose={() => setExerciseModal(false)} />

      <AddSubExerciseModal exercise={selectedExercise} grammar={grammar} show={subExerciseModal} close={() => setSubExerciseModal(false)} />
      <EditSubExerciseModal subExercise={selectedSubExercise} exercise={selectedExercise} grammar={grammar} show={editSubExerciseModal} close={() => setEditSubExerciseModal(false)} />
      <EditExerciseModal exercise={selectedExercise} grammar={grammar} show={editExerciseModal} close={() => setEditExerciseModal(false)} />
      {/* <RemoveSubExerciseModal subExercise={selectedSubExercise} exercise={selectedExercise} grammar={grammar} show={editSubExerciseModal} close={() => setEditSubExerciseModal(false)} /> */}
      <div>
        {grammar.exercises.map((exercise) => (
          <Exercise exercise={exercise} key={exercise.grammarExerciseId}/>
        ))}
      </div>
    </div>
  );
}

// const Exercise = (props: {
//   exercise: GrammarExercise,
//   showResults: boolean,
// }) => {
//   const answers = props.exercise.answers.split(",")
//   if (props.exercise.value.indexOf("_") !== -1) {
//     return <InputExercice {...props} answers={answers} />
//   }
//   return null
//   // const selectable = props.exercise.value.match(/\(([a-zñáéíóúü]*\/)*[a-zñáéíóúü]*\)/gi)
//   // if (selectable && selectable.length) {
//   //   return <SelectableExercice {...props} answers={answers} />
//   // }
//   // return <TextExercice {...props} answers={answers} />
// }

// const compare = (a: string, b: string) => {
//   const filteredAnswer = (a || "").replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
//   const expectedAnswer = (b || "").replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
//   return filteredAnswer === expectedAnswer;
// }

// const TextExercice = ({exercise, showResults, answers}: {
//   exercise: GrammarExercise,
//   showResults: boolean,
//   answers: string[]
// }) => {
//   const [answer, setAnswer] = useState<string>("");

//   const filteredAnswer = answer.replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
//   const expectedAnswer = exercise.answers.replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
//   // console.log(filteredAnswer, expectedAnswer, filteredAnswer === expectedAnswer)
//   const correct = showResults && expectedAnswer === filteredAnswer;
//   const incorrect = showResults && expectedAnswer !== filteredAnswer && filteredAnswer !== "";
//   const noAnswer = showResults && filteredAnswer === "";

//   return (
//     <TextExerciseContainer>
//       <span>{exercise.value}</span>
//       {showResults && correct && <TextAnswer correct>{answer}</TextAnswer>}
//       {showResults && incorrect && (
//         <div style={{display: "flex", flexDirection: "column", alignItems: "flex-start"}}>
//           <TextAnswer incorrect>{answer}</TextAnswer>
//           <TextAnswer correct>{subExercise.answers[0]}</TextAnswer>
//         </div>
//         )}
//       {showResults && noAnswer && <TextAnswer noAnswer>{subExercise.answers[0]}</TextAnswer>}
//       {!showResults && <input value={answer} onChange={(e: React.ChangeEvent<HTMLInputElement>) => setAnswer(e.target.value)} />}
//     </TextExerciseContainer>
//   )
// }

// const SelectableExercice = ({subExercise, showResults}: any) => {
//   const [answers, setAnswers] = useState<string[]>([]);

//   const setAnswer = (index: number, answer: string) => {
//     answers[index] = answer;
//     setAnswers([...answers])
//   }

//   const groups = subExercise.value.match(/\(([a-zñáéíóúü]*\/)*[a-zñáéíóúü]*\)/gi);
//   let tmp = subExercise.value;
//   let inputs: number[][] = [];
//   let shift = 0;
//   for(let index in groups) {
//     const indexOf = tmp.indexOf(groups[index]);
//     inputs.push([indexOf + shift, groups[index].length]);
//     tmp = subExercise.value.substring(indexOf + shift + groups[index].length)
//     shift += indexOf + groups[index].length
//   }

//   let lastInput;
//   return (
//     <ExerciseContainer>
//       {inputs.map((input, i) => {
//         lastInput = i !== 0 ? inputs[i-1][0] + inputs[i-1][1] : 0;
//         let results = subExercise.value.substring(input[0], input[0] + input[1]);
//         results = results.substring(1, results.length - 1).split('/')
//         return (
//           <>
//             <span>{subExercise.value.substring(lastInput, input[0])}</span>
//             (<span style={{fontWeight: "bold"}}>
//               {results.map((r: string, ri: number) => (
//                 <>
//                   <Option
//                     showResults={showResults}
//                     incorrect={showResults && r === answers[i] && subExercise.answers[i] !== r}
//                     correct={showResults && subExercise.answers[i] === r}
//                     noAnswer={showResults && answers[i] !== subExercise.answers[i] && subExercise.answers[i] === r && answers[i] === undefined}
//                     active={r === answers[i]} onClick={() => setAnswer(i, r)}
//                   >
//                     {r}
//                   </Option>
//                   {ri !== results.length - 1 && <span>/</span>}
//                 </>
//               ))}
//             </span>)
//           </>
//         )
//       })}
//       {inputs.length ? <span>{subExercise.value.substring(inputs[inputs.length - 1][0] + inputs[inputs.length - 1][1])}</span> : null}
//     </ExerciseContainer>
//   )
// }

// const InputExercice = ({exercise, showResults, answers}: {
//   exercise: GrammarExercise,
//   showResults: boolean,
//   answers: string[]
// }) => {
//   const [answers, setAnswers] = useState<string[]>([]);
//   const [widths, setWidths] = useState<string[]>([]);

//   const setAnswer = (index: number, value: string) => {
//     answers[index] = value;
//     setAnswers([...answers])
//   }

//   let inputs: number[] = [];
//   for(let index in subExercise.value) {
//     if (subExercise.value[index] === "_") {
//       inputs.push(+index)
//     }
//   }
//   let lastInput = 0;

//   const onInputChange = (e: React.ChangeEvent<HTMLInputElement>, index: number) => {
//     setAnswer(index, e.target.value)
//   }
  
//   return (
//     <ExerciseContainer>
//       {inputs.map((input, i) => {
//         lastInput = i !== 0 ? inputs[i-1] : -1;
//         const correct = showResults && compare(subExercise.answers[i], answers[i]);
//         const incorrect = showResults && !compare(subExercise.answers[i], answers[i]) && answers[i] !== undefined;
//         const noAnswer = showResults && answers[i] === undefined;
//         return (
//           <>
//             <span dangerouslySetInnerHTML={{__html: subExercise.value.substring(lastInput + 1, input).replace(/<\/?[^>]+(>|$)/g, "")}} />
//             {showResults ? (
//               <>
//                 {correct && <InputAnswer correct>{subExercise.answers[i]}</InputAnswer>}
//                 {incorrect && (
//                   <>
//                     <InputAnswer incorrect>{answers[i]}</InputAnswer>
//                     {" "}
//                     <InputAnswer correct>{subExercise.answers[i]}</InputAnswer>
//                   </>
//                 )}
//                 {noAnswer && (
//                   <InputAnswer noAnswer>{subExercise.answers[i]}</InputAnswer>
//                 )}
//               </>
//             ) : null}
//             {!showResults && (
//               <InputWithChangeWidth
//                 value={(answers[i] || "")}
//                 setValue={(v: string) => setAnswer(i, v)}
//               />
//             )}
//           </>
//         )
//       })}
//       {inputs.length ? <span>{subExercise.value.substring(inputs[inputs.length - 1] + 1)}</span> : null}
//     </ExerciseContainer>
//   )
// }

// const InputWithChangeWidth = (props: any) => {
//   const [width, setWidth] = useState("");
//   const fakeInputRef = useRef<HTMLDivElement>(null);

//   const setValue = (e: React.ChangeEvent<HTMLInputElement>) => {
//     props.setValue(e.target.value);
//     fakeInputRef.current!.innerHTML = e.target.value;
//     const width = window.getComputedStyle(fakeInputRef.current!).width;
//     setWidth(width);
//   }

//   return (
//     <>
//       <FakeInput ref={fakeInputRef} />
//       <Input
//         width={width}
//         value={props.value}
//         onChange={setValue}
//       />
//     </>
//   )
// }

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

const TextAnswer = styled.div.attrs<any>(({correct, incorrect, noAnswer}: any) => ({
  style: {
    ...(correct ? {
      color: "var(--bs-green)",
    } : {}),
    ...(incorrect ? {
      color: "var(--color-red)",
    } : {}),
    ...(noAnswer ? {
      color: "var(--color-yellow)",
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

const TextExerciseContainer = styled(ExerciseContainer)`
  input {
    width: 100%;
    text-align: left;
  }
`;

const Option = styled.span.attrs<any>(({active, correct, incorrect, noAnswer, showResults}) => ({
  style: {
    ...(active || correct || incorrect || noAnswer ? {
      borderRadius: "4px",
    } : {}),
    ...(showResults ? {
      textDecoration: "none",
      pointerEvents: "none",
    } : {}),
    ...(active ? {
      backgroundColor: "#0084ffaa",
      boxShadow: "0px 0px 6px var(--color-blue)",
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
    } : {})
  }
}))<any>`
  :hover {
    text-decoration: underline;
    cursor: pointer;
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