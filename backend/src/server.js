import app from "./app.js";
import config from "./config/index.js";
import { connectDB } from "./db/index.js";

const startServer = async () => {
  try {
    await connectDB();

    app.listen(config.port, () => {
      console.log(
        `Server running on port ${config.port} in ${config.env} mode`
      );
    });
  } catch (error) {
    console.error("Server startup failed", error);
    process.exit(1);
  }
};

startServer();
