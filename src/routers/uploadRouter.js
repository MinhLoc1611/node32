import express from "express";
import { uploadBase64, uploadImg } from "../controllers/uploadController.js";

const uploadRouter = express.Router();

uploadRouter.post("/upload", uploadImg)
uploadRouter.post("/base64", uploadBase64)

export default uploadRouter;