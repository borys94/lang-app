import styled from "styled-components";
import {Spinner} from "react-bootstrap"

const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
`

export default () => {
  return (
    <Container>
      <Spinner animation="border" role="status">
        <span className="visually-hidden">Loading...</span>
      </Spinner>
    </Container>
  )
}

