import express from "express";
import { getRateRes, getUserRate, rateRes } from "../controllers/rateController.js";

const rateRouter = express.Router();

rateRouter.post("/rate-res",rateRes)
rateRouter.get("/get-user-rate/:user_id",getUserRate)
rateRouter.get("/get-rate-res/:res_id",getRateRes)

export default rateRouter;