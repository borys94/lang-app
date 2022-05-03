import { Navigate, Outlet, useNavigate } from 'react-router-dom';
import { useAppSelector } from '$hooks/index';
import { useEffect, useState } from "react";
import { useDispatch } from 'react-redux';
import styled from "@emotion/styled";

import Header from "$components/Navbar";
import Loader from "$components/Loader";

import api from "$services/api";
import { setUser } from '$stores/user'

const Container = styled.div`
  width: 800px;
  max-width: 100%;
  display: flex;
  justify-content: center;
  margin: 15px auto 0;
`;

const AuthLayout = () => {
  const dispatch = useDispatch()

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
        <Container>
          <Outlet />
        </Container>
      </>
    )
  }
  if (pending) {
    return <Loader />
  }
  return <Navigate to={"/login"} replace />;
};

export default AuthLayout