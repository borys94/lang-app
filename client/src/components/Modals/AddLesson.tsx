import {useState} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";
import { useAppDispatch } from '$hooks/index';
import {addLesson} from "$stores/lessons";

interface Props {
  show: boolean,
  close: () => void
}

const AddLessonModal = ({
  close,
  show
}: Props) => {
  const dispatch = useAppDispatch();
  const handleClose = () => close();
  const [lessonName, setLessonName] = useState("");
  const [language, setLanguage] = useState("Spanish");
  const [level, setLevel] = useState("B1");
  const [pending, setPending] = useState(false);

  const createLesson = async () => {
    setPending(true);
    const lesson = await api.addLesson(lessonName, language, level);
    setLessonName("");
    dispatch(addLesson(lesson));
    setPending(false);
  }

  return (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Add Lesson</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Lesson name</Form.Label>
            <Form.Control placeholder="Lesson name" value={lessonName} onChange={(e) => setLessonName(e.target.value)} />
          </Form.Group>
        </Form>
        <Form.Group className="mb-3" controlId="formLang">
          <Form.Label>Language</Form.Label>
          <Form.Select aria-label="Lang select" value={language} onChange={(e) => setLanguage(e.target.value)}>
            <option value="Spanish">Spanish</option>
            <option value="English">English</option>
            <option value="German">German</option>
          </Form.Select>
        </Form.Group>
        <Form.Group className="mb-3" controlId="formLevel">
          <Form.Label>Language</Form.Label>
          <Form.Select aria-label="Level select" value={level} onChange={(e) => setLevel(e.target.value)}>
            <option value="A1">A1</option>
            <option value="A2">A2</option>
            <option value="B1">B1</option>
            <option value="B2">B2</option>
            <option value="C1">C1</option>
            <option value="C2">C2</option>
          </Form.Select>
        </Form.Group>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>
          Close
        </Button>
        <Button variant="primary" onClick={createLesson} disabled={pending}>
          Save Changes
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default AddLessonModal;