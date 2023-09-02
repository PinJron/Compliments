import axios from "axios";

export default async function logOut() {
  console.log("signOut")
  const response = await axios.post("/api/v1/users/logout")
}

