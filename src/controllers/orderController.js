import initModels from "../models/init-models.js";
import sequelize from "../models/index.js";
import { errorCode, successCode } from "../config/response.js";

const models = initModels(sequelize);

const orderFood = async (req, res) => {
  try {
    let { user_id, food_id, amount, code, arr_sub_id } = req.body;
    let newOrder = {user_id, food_id, amount, code, arr_sub_id};
    models.orders.create(newOrder);
    successCode(res,"","Order thành công")
  } catch (err) {
    errorCode(res, err.message);
  }
};

export { orderFood };
