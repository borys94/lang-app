import { createRoot } from 'react-dom/client';
import { ThemeProvider } from '@mui/material/styles';

import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';

import store from './stores'
import theme from "./theme";
import { Provider } from 'react-redux'

const container = document.getElementById('root');
const root = createRoot(container);
root.render(
  <Provider store={store}>
    <ThemeProvider theme={theme}>
      <App tab="home" />
    </ThemeProvider>
  </Provider>
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
