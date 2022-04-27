import React, {useState} from "react"
import styled from "styled-components"
import { Navigate, Outlet, useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';

import {Form} from "react-bootstrap"
import api from "$services/api";
import { setUser } from '$stores/user'

import Button from "$components/common/Button"

export default () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const signUp = async (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    await api.signIn(email, password);
    const { currentUser } = await api.getCurrentUser();
    if (currentUser) {
      dispatch(setUser(currentUser))
    }
    navigate("/")
  }

  return (
    <Container>
      <Content>
        <h1>Zaloguj się</h1>
        <div className="row">
          <Form>
            <Form.Group className="mb-3" controlId="formBasicEmail">
              <Form.Label>Email address</Form.Label>
              <Form.Control type="email" placeholder="Enter email" value={email} onChange={(e) => setEmail(e.target.value)} />
              <Form.Text className="text-muted">
                We'll never share your email with anyone else.
              </Form.Text>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formBasicPassword">
              <Form.Label>Password</Form.Label>
              <Form.Control type="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} />
            </Form.Group>
            <Form.Group className="mb-3" controlId="formBasicCheckbox">
              <Form.Check type="checkbox" label="Check me out" />
            </Form.Group>
            <Button variant="primary" type="submit" onClick={signUp}>
              Zaloguj się
            </Button>
          </Form>
        </div>
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
  padding: 30px;
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