import { useState } from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHouse, faBars } from '@fortawesome/free-solid-svg-icons'

import Menu from "./Menu";

const Container = styled.div`
  height: 50px;
  border-bottom: 1px solid #ddd;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 10px;
  margin-bottom: 10px;
  box-shadow: 0 0 27px -6px rgb(60 89 131 / 20%);
  background-color: white;
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  z-index: 1;

  i {
    font-size: 40px;
    cursor: pointer;
  }
`;

export default () => {
  const [activeMenu, setActiveMenu] = useState(false);
  return (
    <div>
      <Container>
        <Link to="/">
          <FontAwesomeIcon icon={faHouse} />
        </Link>
        <div onClick={() => setActiveMenu(!activeMenu)}>
          <FontAwesomeIcon icon={faBars} />
        </div>
      </Container>
      <Menu active={activeMenu} onHide={() => setActiveMenu(false)} />
    </div>
  )
}