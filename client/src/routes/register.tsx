import React, {useState} from "react"

import {Form, Button} from "react-bootstrap"
import Api from "../services/api";

const RegisterRoute = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const signUp = async (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    await Api.signUp(email, password);
  }

  return (
    <div className="container">
      <h1>Sign up</h1>
      <div className="row">
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
      </div>
    </div>
  )
}

export default RegisterRoute