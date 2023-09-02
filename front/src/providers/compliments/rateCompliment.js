import axios from "axios";
import ax from "../../main.js";

export default async function rateCompliment(id, purpose) {
  const response = await fetch(`/api/v1/compliments/${id}/${purpose}`, {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
    },
    credentials: "same-origin",
  });
}
