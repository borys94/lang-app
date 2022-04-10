import {useState, useEffect} from "react";
import {useParams} from "react-router-dom";
import { Button } from "react-bootstrap";
import styled from "styled-components";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark, faPlus } from '@fortawesome/free-solid-svg-icons'

import api from "$services/api";

import AddWordModal from "$components/Modals/AddWord";
import AddSentenceModal from "$components/Modals/AddSentence";
import Box from "$components/common/Box";

import {Lesson, Vocabulary, Sentences} from "$types/lessons";
import { useAppSelector, useAppDispatch } from '$hooks/index';
import LanguageService from "$services/language";


export default function Lessons() {
  const [words, setWords] = useState([] as any[])
  const [trainingWords, setTrainingWords] = useState([] as any[])
  const userId = useAppSelector(state => state.user.id)
  
  let params = useParams();
  useEffect(() => {
    const fetchLesson = async () => {
      if (params.lessonId) {
        const { words } = await api.getLesson(params.lessonId);
        const trainingWords = await api.getWordsInLesson(+params.lessonId);
        setTrainingWords(trainingWords)
        setWords(words)
      }
    }
    fetchLesson();
  }, [])

  const removeWord = async (id: number) => {
    await api.removeWord(id);
    setLesson({
      lesson: lesson.lesson,
      vocabulary: lesson.vocabulary.filter(word => word.id !== id),
      sentences: lesson.sentences,
    })
  }

  const addWordToTraining = async (word: any) => {
    await api.addWordToTraining(userId, word.word_id, LanguageService.get(), word.type);
    if (params.lessonId) {
      setTrainingWords(await api.getWordsInLesson(+params.lessonId));
    }
  }

  const [showModal, setShowModal] = useState(false);
  const [showSentenceModal, setShowSentenceModal] = useState(false);
  const [lesson, setLesson] = useState({
    lesson: {} as Lesson,
    vocabulary: [] as Vocabulary,
    sentences: [] as Sentences,
  })

  return (
    <div>
      <LessonHeader>
        <div>
          {lesson.lesson.name} / {lesson.lesson.level}
        </div>
        <ButtonWrapper>
          <Button onClick={() => setShowModal(true)}>Add word</Button>
          <Button onClick={() => setShowSentenceModal(true)}>Add sentence</Button>
        </ButtonWrapper>
      </LessonHeader>
      {params.lessonId && <AddWordModal lessonId={+params.lessonId} show={showModal} close={() => setShowModal(false)} />}
      {params.lessonId && <AddSentenceModal lessonId={+params.lessonId} show={showSentenceModal} close={() => setShowSentenceModal(false)} />}
      <div className="row">
        <div className="col-md-6">
          {words.filter(w => w.type === "word").map((word: any) => (
            <div key={word.word_id}>
              <Box success={trainingWords.find(tw => tw.external_id === word.word_id)}>
                <b style={{marginRight: "10px"}}>{word.value}</b> {word.translated}
                {/* <RemoveWord onClick={() => removeWord(word.id)}>
                  <FontAwesomeIcon icon={faXmark} />
                </RemoveWord> */}
                <AddWord onClick={() => addWordToTraining(word)}>
                  <FontAwesomeIcon icon={faPlus} />
                </AddWord>
              </Box>
            </div>
          ))}
        </div>
        <div className="col-md-6">
          {words.filter(w => w.type === "sentence").map((word: any) => (
            <div key={word.word_id}>
              <Box success={trainingWords.find(tw => tw.value === word.value)}>
                <b style={{marginRight: "10px"}}>{word.value}</b> {word.translated}
                {/* <RemoveWord onClick={() => removeWord(word.id)}>
                  <FontAwesomeIcon icon={faXmark} />
                </RemoveWord> */}
                <AddWord onClick={() => addWordToTraining(word)}>
                  <FontAwesomeIcon icon={faPlus} />
                </AddWord>
              </Box>
            </div>
          ))}
        </div>
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
`