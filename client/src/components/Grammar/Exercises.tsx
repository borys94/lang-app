import {useState, useEffect, useRef} from "react";
import { Button } from "react-bootstrap";
import styled from "styled-components";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark, faPlus } from '@fortawesome/free-solid-svg-icons'

import api from "$services/api";
import { useAppSelector, useAppDispatch } from '$hooks/index';

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
  const isAdmin = useAppSelector(state => {
    return state.user.role === "admin"
  })
  
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
  const [solveMode, setSolveMode] = useState(false);
  const [points, setPoints] = useState(0);
  const [showResults, setShowResults] = useState(false);

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
      {isAdmin && <Button onClick={() => setExerciseModal(true)}>Add exercise</Button>}
      <Button variant="success" onClick={() => setSolveMode(!solveMode)}>Try solve!</Button>
      {solveMode && <Button variant="success" onClick={() => setShowResults(true)}>Show results</Button>}
      <AddExerciseModal grammar={grammar} show={exerciseModal} close={() => setExerciseModal(false)} />
      <AddSubExerciseModal exercise={selectedExercise} grammar={grammar} show={subExerciseModal} close={() => setSubExerciseModal(false)} />
      <EditSubExerciseModal subExercise={selectedSubExercise} exercise={selectedExercise} grammar={grammar} show={editSubExerciseModal} close={() => setEditSubExerciseModal(false)} />
      <EditExerciseModal exercise={selectedExercise} grammar={grammar} show={editExerciseModal} close={() => setEditExerciseModal(false)} />
      {/* <RemoveSubExerciseModal subExercise={selectedSubExercise} exercise={selectedExercise} grammar={grammar} show={editSubExerciseModal} close={() => setEditSubExerciseModal(false)} /> */}
      <div className="row">
        {exercises.map((exercise: any) => (
          <Box hoverable={false} key={exercise.exercise_id}>
            {isAdmin && <AddExerciseButton onClick={() => {
              setSubExerciseModal(true);
              setSelectedExercise(exercise);
            }}>
              <FontAwesomeIcon icon={faPlus} />
            </AddExerciseButton>}
            <div>
              <b>
                {exercise.name} {" "}
                {/* <Exercise exercise={exercise}/> */}
                {!solveMode && isAdmin && <EditSubExercise onClick={() => onEditExerciseClick(exercise)}>
                  Edit
                </EditSubExercise>}
              </b>
              <ol>
                {exercise.subExercises.map((subExercise: any) => (
                  <li key={subExercise.sub_exercise_id}>
                    
                    {!solveMode ? <span dangerouslySetInnerHTML={{__html: subExercise.value}} /> : null}
                    {solveMode ? <Exercise showResults={showResults} subExercise={subExercise}/> : null}
                    {" "}
                    {!solveMode && isAdmin && <EditSubExercise onClick={() => onEditSubExerciseClick(exercise, subExercise)}>
                      Edit
                    </EditSubExercise>}
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

const Exercise = (props: any) => {
  if (props.subExercise.value.indexOf("_") !== -1) {
    return <InputExercice {...props} />
  }
  const selectable = props.subExercise.value.match(/\(([a-zñáéíóúü]*\/)*[a-zñáéíóúü]*\)/gi)
  if (selectable && selectable.length) {
    return <SelectableExercice {...props} />
  }
  return <TextExercice {...props} />
}

const compare = (a: string, b: string) => {
  const filteredAnswer = (a || "").replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
  const expectedAnswer = (b || "").replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
  return filteredAnswer === expectedAnswer;
}

const TextExercice = ({subExercise, showResults}: any) => {
  const [answer, setAnswer] = useState<string>("");

  const filteredAnswer = answer.replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
  const expectedAnswer = subExercise.answers[0].replace(".", "").toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "").trim();
  // console.log(filteredAnswer, expectedAnswer, filteredAnswer === expectedAnswer)
  const correct = showResults && expectedAnswer === filteredAnswer;
  const incorrect = showResults && expectedAnswer !== filteredAnswer && filteredAnswer !== "";
  const noAnswer = showResults && filteredAnswer === "";

  return (
    <TextExerciseContainer>
      <span>{subExercise.value}</span>
      {showResults && correct && <TextAnswer correct>{answer}</TextAnswer>}
      {showResults && incorrect && (
        <div style={{display: "flex", flexDirection: "column", alignItems: "flex-start"}}>
          <TextAnswer incorrect>{answer}</TextAnswer>
          <TextAnswer correct>{subExercise.answers[0]}</TextAnswer>
        </div>
        )}
      {showResults && noAnswer && <TextAnswer noAnswer>{subExercise.answers[0]}</TextAnswer>}
      {!showResults && <input value={answer} onChange={(e: React.ChangeEvent<HTMLInputElement>) => setAnswer(e.target.value)} />}
    </TextExerciseContainer>
  )
}

const SelectableExercice = ({subExercise, showResults}: any) => {
  const [answers, setAnswers] = useState<string[]>([]);

  const setAnswer = (index: number, answer: string) => {
    answers[index] = answer;
    setAnswers([...answers])
  }

  const groups = subExercise.value.match(/\(([a-zñáéíóúü]*\/)*[a-zñáéíóúü]*\)/gi);
  let tmp = subExercise.value;
  let inputs: number[][] = [];
  let shift = 0;
  for(let index in groups) {
    const indexOf = tmp.indexOf(groups[index]);
    inputs.push([indexOf + shift, groups[index].length]);
    tmp = subExercise.value.substring(indexOf + shift + groups[index].length)
    shift += indexOf + groups[index].length
  }

  let lastInput;
  return (
    <ExerciseContainer>
      {inputs.map((input, i) => {
        lastInput = i !== 0 ? inputs[i-1][0] + inputs[i-1][1] : 0;
        let results = subExercise.value.substring(input[0], input[0] + input[1]);
        results = results.substring(1, results.length - 1).split('/')
        return (
          <>
            <span>{subExercise.value.substring(lastInput, input[0])}</span>
            (<span style={{fontWeight: "bold"}}>
              {results.map((r: string, ri: number) => (
                <>
                  <Option
                    showResults={showResults}
                    incorrect={showResults && r === answers[i] && subExercise.answers[i] !== r}
                    correct={showResults && subExercise.answers[i] === r}
                    noAnswer={showResults && answers[i] !== subExercise.answers[i] && subExercise.answers[i] === r && answers[i] === undefined}
                    active={r === answers[i]} onClick={() => setAnswer(i, r)}
                  >
                    {r}
                  </Option>
                  {ri !== results.length - 1 && <span>/</span>}
                </>
              ))}
            </span>)
          </>
        )
      })}
      {inputs.length ? <span>{subExercise.value.substring(inputs[inputs.length - 1][0] + inputs[inputs.length - 1][1])}</span> : null}
    </ExerciseContainer>
  )
}

const InputExercice = ({subExercise, showResults}: any) => {
  const [answers, setAnswers] = useState<string[]>([]);
  const [widths, setWidths] = useState<string[]>([]);

  const setAnswer = (index: number, value: string) => {
    answers[index] = value;
    setAnswers([...answers])
  }

  let inputs: number[] = [];
  for(let index in subExercise.value) {
    if (subExercise.value[index] === "_") {
      inputs.push(+index)
    }
  }
  let lastInput = 0;

  const onInputChange = (e: React.ChangeEvent<HTMLInputElement>, index: number) => {
    setAnswer(index, e.target.value)
  }
  
  return (
    <ExerciseContainer>
      {inputs.map((input, i) => {
        lastInput = i !== 0 ? inputs[i-1] : -1;
        const correct = showResults && compare(subExercise.answers[i], answers[i]);
        const incorrect = showResults && !compare(subExercise.answers[i], answers[i]) && answers[i] !== undefined;
        const noAnswer = showResults && answers[i] === undefined;
        return (
          <>
            <span dangerouslySetInnerHTML={{__html: subExercise.value.substring(lastInput + 1, input).replace(/<\/?[^>]+(>|$)/g, "")}} />
            {showResults ? (
              <>
                {correct && <InputAnswer correct>{subExercise.answers[i]}</InputAnswer>}
                {incorrect && (
                  <>
                    <InputAnswer incorrect>{answers[i]}</InputAnswer>
                    {" "}
                    <InputAnswer correct>{subExercise.answers[i]}</InputAnswer>
                  </>
                )}
                {noAnswer && (
                  <InputAnswer noAnswer>{subExercise.answers[i]}</InputAnswer>
                )}
              </>
            ) : null}
            {!showResults && (
              <InputWithChangeWidth
                value={(answers[i] || "")}
                setValue={(v: string) => setAnswer(i, v)}
              />
            )}
          </>
        )
      })}
      {inputs.length ? <span>{subExercise.value.substring(inputs[inputs.length - 1] + 1)}</span> : null}
    </ExerciseContainer>
  )
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