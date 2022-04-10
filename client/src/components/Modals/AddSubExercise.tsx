import {useState} from "react";

import { Button, Modal, Form, Alert } from "react-bootstrap";
import api from "$services/api";

interface Props {
  show: boolean,
  close: () => void,
  grammar: any,
  exercise: any
}

const AddSubExerciseModal = ({
  close,
  show,
  grammar,
  exercise
}: Props) => {
  const handleClose = () => close();
  const [exerciseName, setExerciseName] = useState("");
  const [answers, setAnswers] = useState("");
  const [pending, setPending] = useState(false);
  const [errors, setErrors] = useState<any[]>([]);

  const addExercise = async () => {
    setPending(true);
    const response = await api.addSubExercise(grammar.grammar_id, exercise.exercise_id, exerciseName, answers);
    if (response.errors) {
      setErrors(response.errors)
    } else {
      setErrors([])
    }
    setPending(false);
  }

  return (
    <Modal size="lg" show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Add exercise</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        {errors.length && (
          <Alert variant="danger">
            <ul>
              {errors.map((error, i) => <li key={i}>{error.message}</li>)}
            </ul>
          </Alert>
        )}
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
        <Button variant="primary" onClick={addExercise} disabled={pending}>
          Save Changes
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default AddSubExerciseModal;