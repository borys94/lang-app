import { configureStore } from '@reduxjs/toolkit'

import user from "./user";
import lessons from "./lessons";

const store = configureStore({
  reducer: {
    user,
    lessons
  },
})

export default store;

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch