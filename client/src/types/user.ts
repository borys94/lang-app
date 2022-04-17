export interface CurrentUser {
  currentUser: {
    email: string;
    id: number;
    role: string
  } | null
}