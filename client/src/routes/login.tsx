import React, {useState} from "react"
import styled from "styled-components"
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';

import FormControl from '@mui/material/FormControl';
import FormGroup from '@mui/material/FormGroup';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';

import { setUser } from '$stores/user'
import useRequest from "$hooks/useRequest";

const LoginRoute = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [doRequest, errors] = useRequest({
    url: '/api/api/users/signIn',
    method: 'post',
    body: {
      email,
      password,
    },
    onSuccess: (currentUser) => {
      dispatch(setUser(currentUser))
      navigate("/")
    }
  });

  const signIn = async (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    await doRequest();
  }

  return (
    <Container>
      <Content>
        <h1>Zaloguj się</h1>
        <FormGroup>
          <FormControl sx={{ m: 1}}>
            <TextField
              value={email}
              error={!!errors?.find(error => error.field === "email")}
              helperText={errors && errors.find(error => error.field === "email")?.message}
              onChange={(e) => setEmail(e.target.value)}
              label="Email"
              variant="standard"
            />
          </FormControl>
          <FormControl sx={{ m: 1}}>
            <TextField
              type="password"
              value={password}
              error={!!errors?.find(error => error.field === "password")}
              helperText={errors && errors.find(error => error.field === "password")?.message}
              onChange={(e) => setPassword(e.target.value)}
              label="Password"
              variant="standard"
            />
          </FormControl>
          <Button variant="contained" onClick={signIn}>Zaloguj się</Button>
        </FormGroup>
      </Content>
    </Container>
  )
}

const Container = styled.div`
  height: 100%;
  left: 0;
  overflow-y: auto;
  top: 0;
  width: 100%;
  position: fixed;
`

const Content = styled.div`
  align-items: center;
  display: flex;
  height: 100%;
  justify-content: center;
  flex-direction: column;
  position: relative;
  width: 100%;
  max-width: 375px;
  margin: 0 auto;

  > div {
    width: 100%;
  }
`

export default LoginRoute;