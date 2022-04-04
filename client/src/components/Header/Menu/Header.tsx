import styled from "styled-components";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHouse, faUser } from '@fortawesome/free-solid-svg-icons'

import { useAppSelector, useAppDispatch } from '../../../hooks';

const Container = styled.div`
  height: 60px;
  width: 100%;
  background-color: #eee;
  border-bottom: 1px solid #ddd;
  display: flex;
  align-items: center;
  padding-left: 15px;
  cursor: pointer;
`;

export default () => {
  const email = useAppSelector(state => {
    return state.user.email
  })
  return (
    <Container>
      <div>
        <FontAwesomeIcon icon={faUser} />
      </div>
      <div>
        {email}
      </div>
    </Container>
  )
}

