import './App.css';

import { BrowserRouter, Routes, Route } from 'react-router-dom';

import OtherPage from './OtherPage';
import WordCategories from "./components/WordCategories";
import Home from "./routes/home";
import Login from "./components/Auth/Login";
import Training from "./routes/training";
import Lesson from "./routes/Lesson";
import Grammars from "./components/Grammars";
import Grammar from "./components/Grammars/Grammar";
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
            <Route path="wordCategories" element={<WordCategories />} />
            <Route path="lessons/:lessonId" element={<Lesson />} />
            <Route path="grammar" element={<Grammars />} />
            <Route path="grammar/:grammarId" element={<Grammar />} />
          </Route>
          <Route path="login" element={<Login />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
