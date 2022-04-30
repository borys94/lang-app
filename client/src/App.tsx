import './App.css';

import { BrowserRouter, Routes, Route } from 'react-router-dom';

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
import AuthLayout from "./routes/AuthLayout";

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <Routes>
          <Route element={<AuthLayout />}>
            <Route path="/" element={<Home />} />
            <Route path="training" element={<Training />} />
            <Route path="otherpage" element={<OtherPage />} />
            <Route path="lessons" element={<Lessons />} />
            <Route path="lessons/:lessonId" element={<Lesson />} />
            <Route path="grammar/:grammarId" element={<Grammar />} />
            <Route path="exercises" element={<Exercises />} />
            <Route path="exercises/:exerciseId" element={<Exercise />} />
            <Route path="exercises/:exerciseId/subExercise/:subExerciseId" element={<SubExercise />} />
          </Route>
          <Route path="login" element={<Login />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
