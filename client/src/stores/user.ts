import { createSlice, PayloadAction } from '@reduxjs/toolkit'

interface User {
  email: string;
  id: number;
  role: string;
}

export const userStore = createSlice({
  name: 'user',
  initialState: {
    email: "",
    id: 0,
    role: ""
  },
  reducers: {
    setUser: (state, action: PayloadAction<User>) => {
      state.email = action.payload.email
      state.id = action.payload.id
      state.role = action.payload.role
    }
  },
})

// Action creators are generated for each case reducer function
export const { setUser } = userStore.actions

export default userStore.reducer