import {useState} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";
import { useAppDispatch } from '$hooks/index';
import TextEditor from "../TextEditor";

interface Props {
  show: boolean,
  close: () => void,
  grammar: any,
}

const AddExerciseModal = ({
  close,
  show,
  grammar,
}: Props) => {
  const dispatch = useAppDispatch();
  const handleClose = () => close();
  const [exerciseName, setExerciseName] = useState("");
  const [pending, setPending] = useState(false);

  const addExercise = async () => {
    setPending(true);
    await api.addExercise(grammar.grammar_id, exerciseName);
    setExerciseName("");
    setPending(false);
  }

  return (
    <Modal size="lg" show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Add exercise</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Name</Form.Label>
            <TextEditor value={exerciseName} onChange={setExerciseName} />
            {/* <Form.Control placeholder="name" value={exerciseName} onChange={(e) => setExerciseName(e.target.value)} /> */}
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

export default AddExerciseModal;