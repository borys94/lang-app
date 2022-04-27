import { Navigate, Outlet, useNavigate } from 'react-router-dom';
import { useAppSelector, useAppDispatch } from '$hooks/index';
import { useEffect, useState } from "react";
import { useDispatch } from 'react-redux';

import Header from "$components/Header";
import Loader from "$components/Loader";

import api from "$services/api";
import { setUser } from '$stores/user'

const AuthLayout = () => {
  const dispatch = useDispatch()
  const navigate = useNavigate();

  const [pending, setPending] = useState(true);
  const isLogged = useAppSelector(state => {
    return !!state.user.email
  })

  const fetchUser = async () => {
    setPending(true);
    const { currentUser } = await api.getCurrentUser();
    if (currentUser) {
      dispatch(setUser(currentUser))
    }
    setPending(false);
  }

  useEffect(() => {
    if (!isLogged) {
      fetchUser();
    }
  }, [])

  

  if (isLogged) {
    return  (
      <>
        <Header />
        <div style={{marginTop: "50px"}} className="container">
          <Outlet />
        </div>
      </>
    )
  }
  if (pending) {
    return <Loader />
  }
  return <Navigate to={"/login"} replace />;
};

export default AuthLayout