import jwt from "jsonwebtoken"

const generateToken = (data) =>{
    // 1: dữ liệu muốn mã hoá thành token => payload
    // 2: secret key => signature
    // 3: hạn sử dụng, thuật toán => header

    return jwt.sign({data}, "FLASH", {expiresIn:"5m"})
}

const checkToken = (token) =>{
    return jwt.verify(token, "FLASH")
}

const decodeToken = (token) =>{
    return jwt.decode(token)
}

const tokenApi = (req,res,next) =>{
    try{
        let {token} = req.headers;

        if(checkToken(token)){
            next();
        }
    } catch(err){
        res.status(401).send(err.message)
    }
}

export {
    generateToken,
    checkToken,
    decodeToken,
    tokenApi
}