import {useState, useEffect} from "react";
import { useNavigate } from "react-router-dom";
import { Button, Form } from "react-bootstrap"

import { useAppSelector } from '$hooks/index';
import AddLessonModal from "$components/Modals/AddLesson";
import AddGrammarModal from "$components/Modals/AddGrammar";
import LessonLevelDropdown from "$components/LessonLevelDropdown";
import Box from "$components/common/Box";
import LanguageService from "$services/language";
import { setLessons } from "$stores/lessons";
import { setGrammars} from "$stores/grammars";

import { useAppDispatch } from '$hooks/index';
import api from "$services/api";
import LevelService, { LevelType } from "$services/level";

export default function Lessons() {
  const navigate = useNavigate();
  const dispatch = useAppDispatch();

  const lessons = useAppSelector(state => {
    return state.lessons.lessons;
  });

  const grammars = useAppSelector(state => {
    return state.grammars.grammars;
  });

  const goToLesson = (id: number) => {
    navigate(`/lessons/${id}`);
  }

  const goToGrammar = (id: number) => {
    navigate(`/grammar/${id}`);
  }

  useEffect(() => {
    const fetchLessons = async () => {
      const data = await api.getWordsInLessons();
      const { lessons } = await api.getLessons(LanguageService.get());
      const { grammars } = await api.getGrammars(LanguageService.get());
      dispatch(setLessons(lessons))
      dispatch(setGrammars(grammars))
      setWordsInLesson(data)
    }

    fetchLessons();
  }, [])

  const [showModal, setShowModal] = useState(false);
  const [addGrammarModal, setAddGrammarModal] = useState(false);
  
  const [wordsInLesson, setWordsInLesson] = useState([] as any);
  const [level, setLevel] = useState(LevelService.get() as LevelType);

  return (
    <div>
      <div>
        <Button onClick={() => setShowModal(true)}>Add lesson</Button>
        <LessonLevelDropdown level={level} setLevel={setLevel}/>
      </div>
      <AddLessonModal show={showModal} close={() => setShowModal(false)} />
      <AddGrammarModal show={addGrammarModal} close={() => setAddGrammarModal(false)} />
      <div className="row">
        {lessons.filter(lesson => lesson.level === level).map((lesson: any) => {
          return (
          <div className="col-md-6 col-lg-4" key={lesson.lesson_id} onClick={() => goToLesson(lesson.lesson_id)}>
            <Box progress={+((wordsInLesson.find((word: any) => word.lesson_id === lesson.lesson_id) || {}).count || 0) / +lesson.words_count}>
              <span style={{marginRight: "10px"}}>{lesson.name}</span><b>{lesson.level}</b>
              <span style={{marginLeft: "auto"}}>
                {lesson.added}
                {" "}
                {(wordsInLesson.find((word: any) => word.lesson_id === lesson.lesson_id) || {}).count || 0}
                \
                {lesson.words_count}
              </span>
            </Box>
          </div>
        )
          })}
      </div>
      <h2>Grammar</h2>
      <Button onClick={() => setAddGrammarModal(true)}>Add grammar</Button>
      <div className="row">
        {grammars.filter(grammar => grammar.level === level).map((grammar: any) => (
          <div className="col-md-6 col-lg-4" key={grammar.grammar_id} onClick={() => goToGrammar(grammar.grammar_id)}>
            <Box>
              <span style={{marginRight: "10px"}}>{grammar.name}</span><b>{grammar.level}</b>
              {/* <span style={{marginLeft: "auto"}}>
                {lesson.added}
                {" "}
                {(wordsInLesson.find((word: any) => word.lesson_id === lesson.lesson_id) || {}).count}
                \
                {lesson.words_count}
              </span> */}
            </Box>
          </div>
        ))}
      </div>
    </div>
  );
}