import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import {Lessons, Lesson} from "$types/lessons";

export const grammarsStore = createSlice({
  name: 'grammars',
  initialState: {
    grammars: [] as Lessons
  },
  reducers: {
    setGrammars: (state, action: PayloadAction<Lessons>) => {
      state.grammars = action.payload
    },

    addGrammar: (state, action: PayloadAction<Lesson>) => {
      state.grammars = [...state.grammars, action.payload]
    }
  },
})

// Action creators are generated for each case reducer function
export const { setGrammars, addGrammar } = grammarsStore.actions

export default grammarsStore.reducer