import {useState, useEffect} from "react";
import {useParams} from "react-router-dom";
import { Button } from "react-bootstrap";
import styled from "styled-components";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark, faPlus } from '@fortawesome/free-solid-svg-icons'

import api from "$services/api";

import AddGrammarExampleModal from "$components/Modals/AddGrammarExample";
import EditGrammarModal from "$components/Modals/EditGrammar";

import Exercises from "$components/Grammar/Exercises";

import Box from "$components/common/Box";

import {Lesson, Vocabulary, Sentences} from "$types/lessons";
import { useAppSelector } from '$hooks/index';
import LanguageService from "$services/language";


export default function Grammar() {
  const [grammar, setGrammar] = useState({} as any)
  const [trainingWords, setTrainingWords] = useState([] as any[])
  const userId = useAppSelector(state => state.user.id)
  
  let params = useParams();
  useEffect(() => {
    const fetchLesson = async () => {
      if (params.grammarId) {
        const { grammar } = await api.getGrammar(params.grammarId);
        const trainingWords = await api.getWordsInLesson(+params.grammarId, true);
        setGrammar(grammar)
        setTrainingWords(trainingWords)
      }
    }
    fetchLesson();
  }, [])

  const onGrammarSave = async () => {
    setEditModal(false);
    const { grammar } = await api.getGrammar(params.grammarId!);
    setGrammar(grammar)
  }

  const removeWord = async (id: number) => {
    await api.removeWord(id);
    setLesson({
      lesson: lesson.lesson,
      vocabulary: lesson.vocabulary.filter(word => word.id !== id),
      sentences: lesson.sentences,
    })
  }

  const addWordToTraining = async (example: any) => {
    await api.addWordToTraining(userId, example.example_id, LanguageService.get(), "grammar");
    if (params.grammarId) {
      const trainingWords = await api.getWordsInLesson(+params.grammarId, true);
      setTrainingWords(trainingWords)
    }
  }

  const [showModal, setShowModal] = useState(false);
  const [editModal, setEditModal] = useState(false);

  const [lesson, setLesson] = useState({
    lesson: {} as Lesson,
    vocabulary: [] as Vocabulary,
    sentences: [] as Sentences,
  })

  return (
    <div>
      <LessonHeader>
        <h1>
          {grammar.name} / {grammar.level}
        </h1>
        <ButtonWrapper>
          <Button onClick={() => setShowModal(true)}>Add example</Button>
          <Button onClick={() => setEditModal(true)}>Edit</Button>
        </ButtonWrapper>
      </LessonHeader>
      {params.grammarId && <AddGrammarExampleModal grammarId={+params.grammarId} show={showModal} close={() => setShowModal(false)} />}
      {params.grammarId && <EditGrammarModal onSave={onGrammarSave} grammar={grammar} show={editModal} close={() => setEditModal(false)} />}
      <div className="row">
        <div dangerouslySetInnerHTML={{__html: grammar.value}} />
      </div>
      <div className="row">
        {grammar.examples && grammar.examples.map((example: any) => (
          <Box key={example.example_id} success={trainingWords.find(tw => tw.external_id === example.example_id)}>
            <b>{example.value}</b> - {example.translated}
            <AddWord onClick={() => addWordToTraining(example)}>
              <FontAwesomeIcon icon={faPlus} />
            </AddWord>
          </Box>
        ))}
      </div>
      {grammar && grammar.grammar_id && <Exercises grammar={grammar} />}
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
