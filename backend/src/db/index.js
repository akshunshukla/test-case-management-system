import pkg from "pg";
import config from "../config/index.js";

const { Pool } = pkg;

const pool = new Pool({
  connectionString: config.database.url,
});

const connectDB = async () => {
  try {
    await pool.query("SELECT 1");
    console.log("PostgreSQL connected successfully");
  } catch (error) {
    console.error("PostgreSQL connection failed", error);
    throw error;
  }
};

export { pool, connectDB };
