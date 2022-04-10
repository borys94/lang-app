import styled from "styled-components";
import { Form } from "react-bootstrap"

import LevelService, { LevelType } from "$services/level";

const Container = styled.div`
  width: 200px;
`;

interface Props {
  level: string;
  setLevel: (level: LevelType) => void;
}

const LessonLevelDropdown = ({level, setLevel}: Props) => {
  const onSetLevel = (level: LevelType) => {
    LevelService.set(level);
    setLevel(level)
  };

  return (
    <Container>
      <Form.Group controlId="formLevel">
        <Form.Select aria-label="Level select" value={level} onChange={(e) => onSetLevel(e.target.value as LevelType)}>
          <option value="A1">A1</option>
          <option value="A2">A2</option>
          <option value="B1">B1</option>
          <option value="B2">B2</option>
          <option value="C1">C1</option>
          <option value="C2">C2</option>
        </Form.Select>
      </Form.Group>
    </Container>
  );
}

export default LessonLevelDropdown