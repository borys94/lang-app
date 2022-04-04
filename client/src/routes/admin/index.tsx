import { Routes, Route, Link } from "react-router-dom";
import { useAppDispatch } from '$hooks/index';
import {useEffect} from "react"


import Lessons from "./Lessons";
import Lesson from "./Lesson";
import api from "$services/api";
import {setLessons} from "$stores/lessons";


export default function Admin() {
  const dispatch = useAppDispatch();
  useEffect(() => {
    const fetchLessons = async () => {
      const lessons = await api.getLessons();
      dispatch(setLessons(lessons))
    }

    fetchLessons();
  })
  return (
    <div>
      Admin Panel
      <Link to="lessons">Lessons</Link>
      <Routes>
        <Route path="lessons" element={<Lessons />} />
        <Route path="lessons/:lessonId" element={<Lesson />} />
      </Routes>
    </div>
  );
}