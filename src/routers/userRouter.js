import express from "express";
import {
  createNguoiDung,
  getNguoiDung,
  getUserPage,
  login,
  removeNguoiDung,
  signUp,
  updateNguoiDung,
} from "../controllers/userController.js";
import { tokenApi } from "../config/jwt.js";

const userRouter = express.Router();


userRouter.get("/get-nguoi-dung", tokenApi, getNguoiDung);
userRouter.post("/create-nguoi-dung", tokenApi, createNguoiDung);
userRouter.put("/update-nguoi-dung/:user_id", tokenApi, updateNguoiDung);
userRouter.delete("/remove-nguoi-dung/:user_id", removeNguoiDung);
userRouter.get("/get-user-page/:page/:pageSize", getUserPage);

// thêm dữ liệu vào table user => Create
userRouter.post("/signup", signUp)

// Kiểm tra dữ liệu trong table user => Read
userRouter.post("/login", login)

export default userRouter;
