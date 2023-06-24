import express from "express";
import { orderFood } from "../controllers/orderController.js";

const orderRouter = express.Router();

orderRouter.post("/order-food",orderFood)

export default orderRouter;