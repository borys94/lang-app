import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import {Grammar} from "$types/responses";

export const grammarsStore = createSlice({
  name: 'grammars',
  initialState: {
    grammarList: [] as Grammar[]
  },
  reducers: {
    setGrammarList: (state, action: PayloadAction<Grammar[]>) => {
      state.grammarList = action.payload
    },

    addGrammar: (state, action: PayloadAction<Grammar>) => {
      state.grammarList = [...state.grammarList, action.payload]
    },

    deleteGrammar: (state, action: PayloadAction<number>) => {
      state.grammarList = state.grammarList.filter(grammar => grammar.grammarId !== action.payload)
    },

    editGrammar: (state, action: PayloadAction<Grammar>) => {
      state.grammarList = state.grammarList.map(grammar => {
        if (grammar.grammarId === action.payload.grammarId) {
          return {...action.payload}
        }
        return grammar
      })
    }
  },
})

// Action creators are generated for each case reducer function
export const { setGrammarList, addGrammar, deleteGrammar, editGrammar } = grammarsStore.actions

export default grammarsStore.reducer