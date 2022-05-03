import {useState} from 'react';
import { Link } from "react-router-dom";

import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import Select from '@mui/material/Select';
import MenuItem from '@mui/material/MenuItem';
import InputLabel from '@mui/material/InputLabel';
import FormControl from '@mui/material/FormControl';
import FormGroup from '@mui/material/FormGroup';
import TextField from '@mui/material/TextField';
import Snackbar from '@mui/material/Snackbar';
import Alert from '@mui/material/Alert';
import CircularProgress from '@mui/material/CircularProgress';
import FormHelperText from '@mui/material/FormHelperText';

import TextEditor from "$components/TextEditor";
import useRequest from "$hooks/useRequest";

import { Grammar } from "$types/responses";

type Props = {
  open: boolean;
  handleClose: () => void;
  grammar: Grammar
}

export const AddGrammarExerciseDialog = ({
  open,
  handleClose,
  grammar,
}: Props) => {
  const [name, setName] = useState("");
  const [value, setValue] = useState("");
  const [answers, setAnswers] = useState("");
  const [plainText, setPlainText] = useState(false);
  const [pending, setPending] = useState(false);

  const [alertOpen, setAlertOpen] = useState(false);

  const [doRequest, errors] = useRequest({
    url: `/api/api/grammar/${grammar.grammarId}/exercise`,
    method: 'post',
    body: {
      name,
      value,
      answers,
    },
    onSuccess: (data) => {
      // setGrammar(data);
      setAlertOpen(true);
      handleClose();
    }
  });

  const submit = async () => {
    setPending(true);
    await doRequest();
    setPending(false);
  }

  return (
    <div>
      <Dialog
        fullWidth
        maxWidth="md"
        open={open}
        onClose={handleClose}
      >
        <DialogTitle>
          Add Grammar Exercise
        </DialogTitle>
        <DialogContent>
          <FormGroup>
            <FormControl sx={{ m: 1}}>
              <TextField
                error={!!errors?.find(error => error.field === "name")}
                onChange={(e) => setName(e.target.value)}
                label="Title"
                variant="standard"
                value={name}
                helperText={errors && errors.find(error => error.field === "name")?.message}
              />
            </FormControl>
            <FormControl variant="standard" sx={{ m: 1 }} error={!!errors?.find(error => error.field === "value")}>
              <TextEditor value={value} onChange={setValue} />
              {!!errors?.find(error => error.field === "value") && (
                <FormHelperText>
                  {errors && errors.find(error => error.field === "value")?.message}
                </FormHelperText>
              )}
            </FormControl>
            <FormControl sx={{ m: 1}}>
              <TextField
                error={!!errors?.find(error => error.field === "answers")}
                onChange={(e) => setAnswers(e.target.value)}
                label="Answers"
                variant="standard"
                value={answers}
                helperText={errors && errors.find(error => error.field === "answers")?.message}
              />
            </FormControl>
          </FormGroup>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={submit} disabled={pending}>
            {pending && <CircularProgress
              size={24}
              sx={{
                position: 'absolute',
                top: '50%',
                left: '50%',
                marginTop: '-12px',
                marginLeft: '-12px',
              }}
            />}
            Save
          </Button>
        </DialogActions>
      </Dialog>

      <Snackbar open={alertOpen} autoHideDuration={6000} onClose={() => setAlertOpen(false)}>
        <Alert
          onClose={() => setAlertOpen(false)}
          variant="filled"
          severity="success"
          sx={{ width: '100%' }}
        >
          Grammar exercise added!
        </Alert>
      </Snackbar>
    </div>
  );
}
