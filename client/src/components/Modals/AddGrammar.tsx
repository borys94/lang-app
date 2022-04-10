import {useState} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";
import { useAppDispatch } from '$hooks/index';
import {addLesson} from "$stores/lessons";

import TextEditor from "../TextEditor";

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
  const [grammarName, setGrammarName] = useState("");
  const [language, setLanguage] = useState("Spanish");
  const [level, setLevel] = useState("A2");
  const [pending, setPending] = useState(false);
  const [textValue, setTextValue] = useState("");

  const createGrammar = async () => {
    setPending(true);
    const lesson = await api.addGrammar(grammarName, language, level, textValue);
    setGrammarName("");
    dispatch(addLesson(lesson));
    setPending(false);
  }

  return (
    <Modal size="lg" show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Add grammar</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Name</Form.Label>
            <Form.Control placeholder="name" value={grammarName} onChange={(e) => setGrammarName(e.target.value)} />
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
        <TextEditor value={textValue} onChange={setTextValue} />
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>
          Close
        </Button>
        <Button variant="primary" onClick={createGrammar} disabled={pending}>
          Save Changes
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default AddLessonModal;