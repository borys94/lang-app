import { createSlice, PayloadAction } from '@reduxjs/toolkit'

interface User {
  email: string;
  id: number
}

export const userStore = createSlice({
  name: 'user',
  initialState: {
    email: "",
    id: 0,
  },
  reducers: {
    setUser: (state, action: PayloadAction<User>) => {
      state.email = action.payload.email
      state.id = action.payload.id
    }
  },
})

// Action creators are generated for each case reducer function
export const { setUser } = userStore.actions

export default userStore.reducer