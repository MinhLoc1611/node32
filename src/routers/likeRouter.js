import express from "express";
import { getLikeRes, getUserLike, likeRes, unLikeRes } from "../controllers/likeController.js";

const likeRouter = express.Router();

likeRouter.post("/like-res/:user_id/:res_id",likeRes)
likeRouter.delete("/unlike-res/:user_id/:res_id",unLikeRes)
likeRouter.get("/get-user-like/:user_id",getUserLike)
likeRouter.get("/get-like-res/:res_id",getLikeRes)

export default likeRouter;