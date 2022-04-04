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

import {Lesson, Vocabulary, Sentences} from "$types/lessons"


export default function Lessons() {
  
  let params = useParams();
  useEffect(() => {
    const fetchLesson = async () => {
      if (params.lessonId) {
        setLesson(await api.getLesson(params.lessonId));
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

  const addWordToTraining = async (id: number) => {
    await api.addWordToTraining(id);
  }

  const addSentenceToTraining = async (id: number) => {
    await api.addSentenceToTraining(id);
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
          {lesson.vocabulary.map((word: any) => (
            <div key={word.id}>
              <Box success={!!word.nextdate}>
                <b style={{marginRight: "10px"}}>{word.value}</b> {word.translated}
                {/* <RemoveWord onClick={() => removeWord(word.id)}>
                  <FontAwesomeIcon icon={faXmark} />
                </RemoveWord> */}
                <AddWord onClick={() => addWordToTraining(word.id)}>
                  <FontAwesomeIcon icon={faPlus} />
                </AddWord>
              </Box>
            </div>
          ))}
        </div>
        <div className="col-md-6">
        {lesson.sentences.map((sentence: any) => (
          <div key={sentence.id}>
            <Box success={!!sentence.nextdate}>
              <b style={{marginRight: "10px"}}>{sentence.value}</b> {sentence.translated}
              {/* <RemoveWord onClick={() => removeWord(sentence.id)}>
                <FontAwesomeIcon icon={faXmark} />
              </RemoveWord> */}
              <AddWord onClick={() => addSentenceToTraining(sentence.id)}>
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