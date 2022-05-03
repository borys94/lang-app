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
}

export const AddGrammarDialog = (props: Props) => {
  const [name, setName] = useState("");
  const [lang, setLang] = useState("Spanish");
  const [level, setLevel] = useState("B1");
  const [value, setValue] = useState("");
  const [pending, setPending] = useState(false);
  const [grammar, setGrammar] = useState<Grammar | null>(null);

  const [alertOpen, setAlertOpen] = useState(false);

  const [doRequest, errors] = useRequest({
    url: '/api/api/grammar',
    method: 'post',
    body: {
      name,
      lang,
      level,
      value,
    },
    onSuccess: (data) => {
      setGrammar(data);
      setAlertOpen(true);
      props.handleClose();
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
        open={props.open}
        onClose={props.handleClose}
      >
        <DialogTitle>
          Add Grammar
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
            <FormControl variant="standard" sx={{ m: 1}}>
              <InputLabel id="add-grammar-dialog-lang-helper-label">Language</InputLabel>
              <Select
                labelId="add-grammar-dialog-lang-helper-label"
                error={!!errors?.find(error => error.field === "lang")}
                value={lang}
                label="Language"
                onChange={(e) => setLang(e.target.value)}
              >
                <MenuItem value="Spanish">Spanish</MenuItem>
                <MenuItem value="English">English</MenuItem>
                <MenuItem value="German">German</MenuItem>
              </Select>
            </FormControl>
            <FormControl variant="standard" sx={{ m: 1 }}>
              <InputLabel id="demo-simple-select-helper-label">Level</InputLabel>
              <Select
                labelId="demo-simple-select-helper-label"
                error={!!errors?.find(error => error.field === "level")}
                id="demo-simple-select"
                value={level}
                label="Level"
                onChange={(e) => setLevel(e.target.value)}
              >
                <MenuItem value="A1">A1</MenuItem>
                <MenuItem value="A2">A2</MenuItem>
                <MenuItem value="B1">B1</MenuItem>
                <MenuItem value="B2">B2</MenuItem>
                <MenuItem value="C1">C1</MenuItem>
                <MenuItem value="C2">C2</MenuItem>
              </Select>
            </FormControl>
            <FormControl variant="standard" sx={{ m: 1 }} error={!!errors?.find(error => error.field === "value")}>
              <TextEditor value={value} onChange={setValue} />
              {!!errors?.find(error => error.field === "value") && (
                <FormHelperText>
                  {errors && errors.find(error => error.field === "value")?.message}
                </FormHelperText>
              )}
            </FormControl>
          </FormGroup>
        </DialogContent>
        <DialogActions>
          <Button onClick={props.handleClose}>Cancel</Button>
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
          action={
            <Button color="inherit" size="small" component={Link} to={`/grammar/${grammar && grammar.grammarId || ""}`}>
              Show
            </Button>
          }
        >
          Grammar added!
        </Alert>
      </Snackbar>
    </div>
  );
}
