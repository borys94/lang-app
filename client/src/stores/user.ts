import { createSlice, PayloadAction } from '@reduxjs/toolkit'

export const userStore = createSlice({
  name: 'user',
  initialState: {
    email: "",
  },
  reducers: {
    setUser: (state, action: PayloadAction<string>) => {
      state.email = action.payload
    }
  },
})

// Action creators are generated for each case reducer function
export const { setUser } = userStore.actions

export default userStore.reducer