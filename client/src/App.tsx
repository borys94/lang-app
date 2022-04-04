import './App.css';

import 'bootstrap/dist/css/bootstrap.min.css';

import { useEffect } from "react";

import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Invoices from "./routes/invoices";
import Home from "./routes/home";
import Login from "./routes/login";
import Admin from "./routes/admin";
import Training from "./routes/training";

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
        dispatch(setUser(currentUser.email))
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
            <Route path="admin/*" element={<Admin />} />
            <Route path="login" element={<Login />} />
            <Route path="otherpage" element={<OtherPage />} />
            <Route path="invoices" element={<Invoices />} />
          </Routes>
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;
