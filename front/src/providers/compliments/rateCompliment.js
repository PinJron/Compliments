import axios from "axios";
import ax from "../../main.js";

export default async function rateCompliment(compliment, purpose) {
  const response = await fetch(`/api/v1/compliments/${compliment}/${purpose}`, {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
    },
    credentials: "same-origin",
  });
}
