import initModels from "../models/init-models.js";
import sequelize from "../models/index.js";
import { errorCode, successCode } from "../config/response.js";

const models = initModels(sequelize);

const rateRes = async(req,res)=>{
    try{
        let {user_id,res_id,amount} = req.body;
        let newRate = {
            user_id,
            res_id,
            amount,
            date_rate:Date.now()
        }
        await models.rate_res.create(newRate)
        successCode(res,"","Đánh giá thành công")
    }catch(err){
        errorCode(res,err.message)
    }
}

const getUserRate = async(req,res) =>{
    try{
        let {user_id} = req.params;
        let data = await models.users.findAll({include:['rate_res'], where:{user_id}})
        successCode(res, data, "Lấy danh sách người dùng đã đánh giá thành công");
    }catch(err){
        errorCode(res,err.message)
    }
}

const getRateRes = async(req,res) =>{
    try{
        let {res_id} = req.params;
        let data = await models.restaurant.findAll({include:['rate_res'], where:{res_id}})
        successCode(res, data, "Lấy danh sách nhà hàng đã được đánh giá thành công");
    }catch(err){
        errorCode(res,err.message)
    }
}

export {
    rateRes,
    getUserRate,
    getRateRes
}