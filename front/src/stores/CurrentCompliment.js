import { ref } from "vue";
import { defineStore } from "pinia";
import fetchRandomCompliment from "@/providers/compliments/fetchRandomCompliment";
import rateCompliment from "@/providers/compliments/rateCompliment";

export const useCurrentComplimentStore = defineStore(
  "CurrentCompliment",
  () => {
    const currentCompliment = ref("");
    // currentCompliment.value = {"status":"ok","is_used":true,"id":119,"name":"123","likes":0,"dislikes":0,"created_at":"2023-08-27T18:13:05.966Z","created_by_id":22}

    let isLiked = ref(false);

    async function getCurrentCompliment() {
      currentCompliment.value = await fetchRandomCompliment();
      console.log(currentCompliment.value.compliment);
      return currentCompliment.value.compliment;
    }
    
    async function rateCurrentCompliment(purpose) {
      await rateCompliment(currentCompliment.value.id, purpose);
      return currentCompliment.value;
    }
    
    return {
      currentCompliment,
      getCurrentCompliment,
      rateCurrentCompliment,
      isLiked,
    };
  }
);
