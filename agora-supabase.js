import { createClient } from "https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm";

// Chave publicável do projeto Supabase existente. Nunca colocar service_role aqui.
const SUPABASE_URL = "https://xovdwvrawnymhpobxuzc.supabase.co";
const SUPABASE_PUBLISHABLE_KEY = "sb_publishable_UjNuZKeDQDgBzVNHqOh4Ww_O4ul5OI5";

export const supabase = createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY);
