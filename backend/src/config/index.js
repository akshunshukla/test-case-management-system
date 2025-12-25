import dotenv from "dotenv";

// Load environment variables
dotenv.config();

const config = {
  port: process.env.PORT ? Number(process.env.PORT) : 3000,
  env: process.env.NODE_ENV || "development",
};

export default config;
