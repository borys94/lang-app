import {useState} from 'react';

import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import Snackbar from '@mui/material/Snackbar';
import Alert from '@mui/material/Alert';
import CircularProgress from '@mui/material/CircularProgress';

import { deleteGrammar } from "$stores/grammars";
import { useAppDispatch } from '$hooks/index';
import useRequest from "$hooks/useRequest";
import { Grammar } from "$types/responses";

type Props = {
  open: boolean;
  handleClose: () => void;
  grammar: Grammar | null
}

export const DeleteGrammarDialog = (props: Props) => {
  const [pending, setPending] = useState(false);
  const [alertOpen, setAlertOpen] = useState(false);

  const dispatch = useAppDispatch()

  const [doRequest, errors] = useRequest({
    url: `/api/api/grammar/${props.grammar && props.grammar.grammarId || ""}`,
    method: 'delete',
    onSuccess: () => {
      dispatch(deleteGrammar(props.grammar!.grammarId));
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
        maxWidth="md"
        open={props.open}
        onClose={props.handleClose}
      >
        <DialogTitle id="alert-dialog-title">
          Are you sure to delete grammar?
        </DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">
            This operation cannot be undone
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={props.handleClose}>Cancel</Button>
          <Button onClick={submit} disabled={pending} color="error">
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
            Delete
          </Button>
        </DialogActions>
      </Dialog>

      <Snackbar open={alertOpen} autoHideDuration={6000} onClose={() => setAlertOpen(false)}>
        <Alert
          variant="filled"
          severity="success"
          sx={{ width: '100%' }}
        >
          Grammar deleted!
        </Alert>
      </Snackbar>
    </div>
  );
}
