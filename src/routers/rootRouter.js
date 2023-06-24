import express from "express";
import userRouter from "./userRouter.js";
import likeRouter from "./likeRouter.js";
import rateRouter from "./rateRouter.js";
import orderRouter from "./orderRouter.js";
import uploadRouter from "./uploadRouter.js";

const rootRouter = express.Router();

rootRouter.use("/user",userRouter)
rootRouter.use("/like",likeRouter)
rootRouter.use("/rate",rateRouter)
rootRouter.use("/order",orderRouter)
rootRouter.use("/upload",uploadRouter)

export default rootRouter;