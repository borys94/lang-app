import {useState} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";
import { useAppDispatch } from '$hooks/index';
import TextEditor from "../../TextEditor";

interface Props {
  show: boolean,
  close: () => void,
  onSave: () => void,
}

const AddExerciseModal = ({
  close,
  show,
  onSave,
}: Props) => {
  const dispatch = useAppDispatch();
  const handleClose = () => close();
  const [exerciseContent, setExerciseContent] = useState("");
  const [pending, setPending] = useState(false);

  const addExercise = async () => {
    setPending(true);
    await api.createExercise(exerciseContent, "Spanish", "B1");
    setExerciseContent("");
    setPending(false);
    onSave();
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
            <Form.Control value={exerciseContent} onChange={(e: any) => setExerciseContent(e.target.value)} />
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