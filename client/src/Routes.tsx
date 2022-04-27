
import { useEffect, useState } from "react";
import { useDispatch } from 'react-redux';
import { BrowserRouter, Routes, Route, useNavigate } from 'react-router-dom';

import OtherPage from './OtherPage';
import Lessons from "./routes/Lessons";
import Home from "./routes/home";
import Login from "./routes/login";
import Training from "./routes/training";
import Lesson from "./routes/Lesson";
import Grammar from "./routes/Grammar";
import Exercises from "./routes/Exercises";
import Exercise from "./routes/Exercise";
import SubExercise from "./routes/SubExercise";

import Header from "$components/Header"
import Loader from "$components/Loader";
import api from "$services/api";


import { setUser } from './stores/user'

function App() {
  const dispatch = useDispatch()

  const [pending, setPending] = useState(false)

  useEffect(() => {
    const fetchUser = async () => {
      setPending(true);
      const { currentUser } = await api.getCurrentUser();
      if (currentUser) {
        dispatch(setUser(currentUser))
      } else {
        document.location = "login"
      }
      setPending(false);
    }

    fetchUser();
  }, [])
  return (
    <Routes>
      {pending && <Loader />}
      {!pending && (
        <>
          {/* <Route path="/" element={<Home />} /> */}
          <Route path="training" element={<Training />} />
          <Route path="otherpage" element={<OtherPage />} />
          <Route path="lessons" element={<Lessons />} />
          <Route path="lessons/:lessonId" element={<Lesson />} />
          <Route path="grammar/:grammarId" element={<Grammar />} />
          <Route path="exercises" element={<Exercises />} />
          <Route path="exercises/:exerciseId" element={<Exercise />} />
          <Route path="exercises/:exerciseId/subExercise/:subExerciseId" element={<SubExercise />} />
        </>
      )}
      <Route path="login" element={<Login />} />
      <Route path="*" element={<Loader />} />
      
    </Routes>

  );
}

export default App;
