import dotenv from "dotenv";

// Load environment variables
dotenv.config();

const config = {
  port: process.env.PORT ? Number(process.env.PORT) : 3000,
  env: process.env.NODE_ENV || "development",
  database: {
    url: process.env.DATABASE_URL || "",
  },
};

export default config;
