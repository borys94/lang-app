import React from "react";
import { Link, useNavigate } from "react-router-dom";
import styled from "styled-components";
import { CSSTransition } from 'react-transition-group';

import Header from "./Header";
import Item from "./Item";
import SubItem from "./SubItem";
import Disclaimer from "./Disclaimer";

import api from "$services/api";


const Container = styled.div`
  .menu-enter {
    transform: translateX(300px);
  }
  .menu-enter-active {
    transform: translateX(0);
    transition: transform 300ms;
  }
  .menu-exit {
    transform: translateX(0);
  }
  .menu-exit-active {
    transform: translateX(300px);
    transition: transform 300ms;
  }

  .background-enter {
    background-color: #fff0;
  }
  .background-enter-active {
    background-color: #0007;
    transition: background-color 300ms;
  }
  .background-enter-done {
    background-color: #0007;
  }
  .background-exit {
    background-color: #0007;
  }
  .background-exit-active {
    background-color: #fff0;
    transition: background-color 300ms;
  }
`;

const Background = styled.div`
  position: fixed;
  top: 50px;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 1;
`

const MenuContainer = styled.div`
  width: 300px;
  position: fixed;
  top: 50px;
  right: 0;
  z-index: 1;
`

type Props = {
  active: boolean,
  onHide: () => void
}

export default ({ active, onHide }: Props) => {
  const navigate = useNavigate();

  const signOut = async () => {
    await api.signOut();
    navigate("/login")
  }

  return (
    <Container>
      <CSSTransition
        in={active}
        timeout={300}
        classNames="background"
        unmountOnExit
      >
        <Background onClick={onHide} />
      </CSSTransition>
      <CSSTransition
        in={active}
        timeout={300}
        classNames="menu"
        unmountOnExit
      >
        <MenuContainer>
          <Header />
          <Item>Home</Item>
          <Item>Lessons</Item>
          <Item>Training</Item>
          <Disclaimer />
          <Item>Languages</Item>
          <SubItem>English</SubItem>
          <SubItem>Spanish</SubItem>
          <SubItem>German</SubItem>
          <Disclaimer />
          <Item onClick={signOut}>Sign out</Item>
        </MenuContainer>
      </CSSTransition>
    </Container>
  )
  }

