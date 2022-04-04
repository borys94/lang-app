import {useState} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";
import { useAppDispatch } from '$hooks/index';

interface Props {
  lessonId: number,
  show: boolean,
  close: () => void
}

const AddWordModal = ({
  lessonId,
  close,
  show
}: Props) => {
  const dispatch = useAppDispatch();
  const handleClose = () => close();
  const [value, setValue] = useState("");
  const [translated, setTranlated] = useState("");
  const [pending, setPending] = useState(false);

  const createWord = async () => {
    setPending(true);
    await api.addWord(lessonId, value, translated);
    setValue("");
    setTranlated("");
    setPending(false);
  }

  return (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Add Word</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Value</Form.Label>
            <Form.Control placeholder="value" value={value} onChange={(e) => setValue(e.target.value)} />
          </Form.Group>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Translated</Form.Label>
            <Form.Control placeholder="translated" value={translated} onChange={(e) => setTranlated(e.target.value)} />
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>
          Close
        </Button>
        <Button variant="primary" onClick={createWord} disabled={pending}>
          Save Changes
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default AddWordModal;