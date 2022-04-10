import {useState, useEffect} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";

interface Props {
  show: boolean,
  close: () => void,
  grammar: any,
  subExercise: any,
  exercise: any;
}

const AddSubExerciseModal = ({
  close,
  show,
  grammar,
  exercise,
  subExercise
}: Props) => {
  const handleClose = () => close();
  const [exerciseName, setExerciseName] = useState("");
  const [answers, setAnswers] = useState("");
  const [pending, setPending] = useState(false);

  useEffect(() => {
    if (show) {
      setExerciseName(subExercise.value);
      const answers = JSON.stringify(subExercise.answers)
      setAnswers(`{${answers.substring(1, answers.length - 1)}}`);
    }
  }, [show])

  const editSubExercise = async () => {
    setPending(true);
    await api.editSubExercise(exercise.grammar_id, exercise.exercise_id, subExercise.sub_exercise_id, exerciseName, answers);
    setPending(false);
  }

  return (
    <Modal size="lg" show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Edit exercise</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <p>{exercise.name}</p>
        <Form>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Value</Form.Label>
            <Form.Control placeholder="value" value={exerciseName} onChange={(e) => setExerciseName(e.target.value)} />
          </Form.Group>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Answers</Form.Label>
            <Form.Control placeholder="answers" value={answers} onChange={(e) => setAnswers(e.target.value)} />
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>
          Close
        </Button>
        <Button variant="primary" onClick={editSubExercise} disabled={pending}>
          Save Changes
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default AddSubExerciseModal;