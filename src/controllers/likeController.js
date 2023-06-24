import initModels from "../models/init-models.js";
import sequelize from "../models/index.js";
import { errorCode, successCode } from "../config/response.js";

const models = initModels(sequelize);

const likeRes = async (req, res) => {
  try {
    let { user_id, res_id } = req.params;
    let newLike = {
      user_id,
      res_id,
      date_like: Date.now(),
    };
    await models.like_res.create(newLike);
    successCode(res, "", "Like thành công");
  } catch (err) {
    errorCode(res, err.message);
  }
};

const unLikeRes = async (req, res) => {
  try {
    let { user_id, res_id } = req.params;
    await models.like_res.destroy({ where: { user_id, res_id } });
    successCode(res, "", "Unlike thành công");
  } catch (err) {
    errorCode(res, err.message);
  }
};

const getUserLike = async (req, res) => {
  try {
    let {user_id} = req.params;
    let data = await models.users.findAll({ include: ["like_res"], where:{user_id} });
    res.send(data)
    // successCode(res, data, "Lấy danh sách người dùng đã like thành công");
  } catch (err) {
    errorCode(res, err.message);
  }
};

const getLikeRes = async (req, res) => {
  try {
    let {res_id} = req.params;
    let data = await models.restaurant.findAll({ include: ["like_res"], where:{res_id} });
    successCode(res, data, "Lấy danh sách nhà hàng đã được like thành công");
  } catch (err) {
    errorCode(res, err.message);
  }
};

export { likeRes, unLikeRes, getUserLike, getLikeRes };
