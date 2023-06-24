import { Sequelize } from "sequelize";
import initModels from "../models/init-models.js";
import sequelize from "../models/index.js";
import { errorCode, failCode, successCode } from "../config/response.js";

const models = initModels(sequelize);

const Op = Sequelize.Op;

const getNguoiDung = async (req, res) => {
  try {
    let data = await models.users.findAll();

    successCode(res, data, "Lấy dữ liệu thành công");
  } catch {
    errorCode(res, "Lỗi BE");
  }
};

const createNguoiDung = async (req, res) => {
  try {
    let { full_name, email, pass_word } = req.body;

    let newUser = {
      full_name,
      email,
      pass_word,
    };

    await models.users.create(newUser);

    successCode(res, data, "Tạo người dùng thành công");
  } catch {
    errorCode(res, "Lỗi BE");
  }
};

const updateNguoiDung = async (req, res) => {
  try {
    let { user_id } = req.params;
    let { full_name, email, pass_word } = req.body;

    let updateUser = {
      full_name,
      email,
      pass_word,
    };

    await models.users.update(updateUser, {
      where: {
        user_id,
      },
    });

    successCode(res, data, "Cập nhật người dùng thành công");
  } catch {
    errorCode(res, "Lỗi BE");
  }
};

const removeNguoiDung = async (req, res) => {
  try {
    let { user_id } = req.params;
    let checkUser = await models.users.findAll({ where: { user_id } });
    if (checkUser.length > 0) {
      await models.users.destroy({ where: { user_id } });
      successCode(res, "", "Xoá người dùng thành công");
    } else {
      failCode(res, "", "Không tìm thấy người dùng");
    }
  } catch {
    errorCode(res, "Lỗi BE");
  }
};

const getUserPage = async (req, res) => {
  let { page, pageSize } = req.params;
  let index = (page - 1) * pageSize;

  let data = await models.users.findAll({
    offset: index,
    limit: Number(pageSize),
  });
  successCode(res, data, "Thành công");
};

import bcrypt from "bcrypt";
import { generateToken } from "../config/jwt.js";

const signUp = async (req, res) => {
  try {
    let { full_name, email, password } = req.body;
    // kiểm tra email có tồn tại hay không
    //
    let checkUser = await models.users.findAll({
      where: {
        email,
      },
    });

    if (checkUser.length > 0) {
      failCode(res, "", "Email đã tồn tại !"); // 400
    } else {
      // yarn add bcrypt

      let newUser = {
        full_name,
        email,
        password: bcrypt.hashSync(password, 10), // mã hóa
      };

      await models.users.create(newUser);

      successCode(res, "", "Đăng ký thành công");
    }
  } catch (err) {
    errorCode(res, err.message);
  }
};

const login = async (req, res) => {
  try {
    let { email, password } = req.body;
    let checkUser = await models.users.findOne({
      where: {
        email,
      },
    });

    if (checkUser) {
      if (bcrypt.compareSync(password, checkUser.password)) {
        checkUser = { ...checkUser, password:""}
        let token = generateToken(checkUser)
        successCode(res, token, "Login thành công");
      } else {
        failCode(res, "", "Mật khẩu không đúng !");
      }
    } else {
      failCode(res, "", "Email không đúng !");
    }
  } catch (err) {
    errorCode(res, err.message);
  }
};

export {
  getNguoiDung,
  createNguoiDung,
  updateNguoiDung,
  removeNguoiDung,
  getUserPage,
  signUp,
  login,
};
