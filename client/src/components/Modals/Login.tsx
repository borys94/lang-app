import {useState, useEffect} from "react";

import { Button, Modal, Form } from "react-bootstrap";
import api from "$services/api";

interface Props {
  show: boolean,
  onClose: () => void,
}

const AddSubExerciseModal = ({
  onClose,
  show,
}: Props) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const signUp = async (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    await api.signIn(email, password);
  }

  return (
    <Modal fullscreen show={show} onHide={onClose}>
      <Modal.Header closeButton>
        <Modal.Title>Edit exercise</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="formBasicEmail">
            <Form.Label>Email address</Form.Label>
            <Form.Control type="email" placeholder="Enter email" value={email} onChange={(e) => setEmail(e.target.value)} />
            <Form.Text className="text-muted">
              We'll never share your email with anyone else.
            </Form.Text>
          </Form.Group>

          <Form.Group className="mb-3" controlId="formBasicPassword">
            <Form.Label>Password</Form.Label>
            <Form.Control type="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} />
          </Form.Group>
          <Form.Group className="mb-3" controlId="formBasicCheckbox">
            <Form.Check type="checkbox" label="Check me out" />
          </Form.Group>
          <Button variant="primary" type="submit" onClick={signUp}>
            Submit
          </Button>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary">
          Register
        </Button>
        <Button variant="primary">
          Login
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default AddSubExerciseModal;