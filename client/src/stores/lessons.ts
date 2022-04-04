import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import {Lessons, Lesson} from "$types/lessons";

export const lessonsStore = createSlice({
  name: 'lessons',
  initialState: {
    lessons: [] as Lessons
  },
  reducers: {
    setLessons: (state, action: PayloadAction<Lessons>) => {
      state.lessons = action.payload
    },

    addLesson: (state, action: PayloadAction<Lesson>) => {
      state.lessons = [...state.lessons, action.payload]
    }
  },
})

// Action creators are generated for each case reducer function
export const { setLessons, addLesson } = lessonsStore.actions

export default lessonsStore.reducer