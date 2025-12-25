import express from "express";
import errorMiddleware from "./middlewares/errorMiddleware.js";
import asyncHandler from "./utils/asyncHandler.js";
import ApiResponse from "./utils/ApiResponse.js";

const app = express();

app.use(express.json());

app.get(
  "/health",
  asyncHandler(async (req, res) => {
    res.status(200).json(new ApiResponse("Server is running", null));
  })
);

app.use(errorMiddleware);
export default app;
