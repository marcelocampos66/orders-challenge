import 'dotenv/config';

const env = process.env;

export const PORT = (env.PORT || 3001);
