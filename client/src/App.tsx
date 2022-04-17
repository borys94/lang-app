import './App.css';

import 'bootstrap/dist/css/bootstrap.min.css';

import { useEffect } from "react";

import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
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

import Header from "./components/Header"
import api from "./services/api";

import { useDispatch } from 'react-redux';
import { setUser } from './stores/user'

function App() {
  const dispatch = useDispatch()
  useEffect(() => {
    const fetchUser = async () => {
      const { currentUser } = await api.getCurrentUser();
      if (currentUser) {
        dispatch(setUser(currentUser))
      }
    }

    fetchUser();
  })
  return (
    <BrowserRouter>
      <div className="App">
        <Header />
        <div style={{marginTop: "50px"}} className="container">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="training" element={<Training />} />
            <Route path="login" element={<Login />} />
            <Route path="otherpage" element={<OtherPage />} />
            <Route path="lessons" element={<Lessons />} />
            <Route path="lessons/:lessonId" element={<Lesson />} />
            <Route path="grammar/:grammarId" element={<Grammar />} />
            <Route path="exercises" element={<Exercises />} />
            <Route path="exercises/:exerciseId" element={<Exercise />} />
            <Route path="exercises/:exerciseId/subExercise/:subExerciseId" element={<SubExercise />} />
            
          </Routes>
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;
