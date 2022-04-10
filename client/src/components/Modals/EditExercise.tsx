import {useState, useEffect} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";
import { useAppDispatch } from '$hooks/index';

interface Props {
  show: boolean,
  close: () => void,
  grammar: any,
  exercise: any,
}

const AddExerciseModal = ({
  close,
  show,
  grammar,
  exercise,
}: Props) => {
  const handleClose = () => close();
  const [exerciseName, setExerciseName] = useState("");
  const [pending, setPending] = useState(false);

  const editExercise = async () => {
    setPending(true);
    await api.editExercise(grammar.grammar_id, exercise.exercise_id, exerciseName);
    setExerciseName("");
    setPending(false);
  }

  useEffect(() => {
    if (show) {
      setExerciseName(exercise.name);
    }
  }, [show])

  return (
    <Modal size="lg" show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Edit exercise</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Name</Form.Label>
            <Form.Control placeholder="name" value={exerciseName} onChange={(e) => setExerciseName(e.target.value)} />
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>
          Close
        </Button>
        <Button variant="primary" onClick={editExercise} disabled={pending}>
          Save Changes
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default AddExerciseModal;