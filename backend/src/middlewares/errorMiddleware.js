import ApiError from "../utils/ApiError.js";

const errorMiddleware = (err, req, res, next) => {
  let statusCode = err.statusCode || 500;
  let message = err.message || "Internal server error";
  let errors = err.errors || [];

  // If error is not an ApiError, hide internal details
  if (!(err instanceof ApiError)) {
    statusCode = 500;
    message = "Internal server error";
    errors = [];
  }

  res.status(statusCode).json({
    success: false,
    message,
    errors,
  });
};

export default errorMiddleware;
