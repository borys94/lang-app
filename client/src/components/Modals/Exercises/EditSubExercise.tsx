import {useState, useEffect} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";
import { useAppDispatch } from '$hooks/index';
import TextEditor from "../../TextEditor";

interface Props {
  show: boolean,
  subExercise: any,
  close: () => void,
  onSave: () => void,
}

const AddExerciseModal = ({
  close,
  show,
  subExercise,
  onSave,
}: Props) => {
  const dispatch = useAppDispatch();
  const handleClose = () => close();
  const [exerciseContent, setExerciseContent] = useState("");
  const [title, setTitle] = useState("");
  const [answers, setAnswers] = useState("");
  const [pending, setPending] = useState(false);

  useEffect(() => {
    if (show) {
      setExerciseContent(subExercise.text);
      setTitle(subExercise.title);
      const answers = JSON.stringify(subExercise.answers)
      setAnswers(subExercise.answers);
    }
  }, [show])

  const addExercise = async () => {
    setPending(true);
    console.log(subExercise)
    await api.updateSubExercise(subExercise.exerciseId, subExercise.id, title, exerciseContent, answers);
    setExerciseContent("");
    setPending(false);
    onSave();
  }

  return (
    <Modal size="lg" show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>Edit sub exercise</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
        <Form.Group className="mb-3" controlId="add-sub-exercise">
            <Form.Label>Title</Form.Label>
            <Form.Control value={title} onChange={(e: any) => setTitle(e.target.value)} />
          </Form.Group>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Name</Form.Label>
            <Form.Control rows={10} as="textarea" value={exerciseContent} onChange={(e) => setExerciseContent(e.target.value)} />
            {/* <TextEditor value={exerciseContent} onChange={setExerciseContent} /> */}
          </Form.Group>
          <Form.Group className="mb-3" controlId="add-sub-exercise">
            <Form.Label>Answers</Form.Label>
            <Form.Control value={answers} onChange={(e: any) => setAnswers(e.target.value)} />
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