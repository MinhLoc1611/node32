import multer from "multer";
import fs from 'fs';

// __dirname: trả về đường dẫn file đang đứng
// process.cwd(): trả về đường dẫn gốc

const storage = multer.diskStorage({
    destination:process.cwd() + "/public/img",
    filename:(req,file,callback) =>{
        let newName = new Date().getTime() + "_" + file.originalname;
        callback(null,newName)
    }
})

const upload = multer({storage})

const uploadImg = (upload.single("file"),(req,res)=>{
    res.send("Upload thành công")
})

// File system FS

const uploadBase64 = (upload.single("file"), (req, res) => {

    // fs.writeFile(process.cwd() + "/test.txt", "Hello world", () => { });
    // fs.appendFile(process.cwd() + "/test.txt", " abc", () => { })
    // let data = fs.readFileSync(process.cwd() + "/test.txt", "utf-8");
    // fs.readFile();
    // fs.copyFile();
    // fs.unlink();
    let file = req.file;
    fs.readFile(process.cwd() + "/public/img/" + file.filename, (err, data) => {
        // parse base64
        let newName = `data:${file.mimetype};base64,${Buffer.from(data).toString("base64")}`;

        res.send(newName);
    })
})

export {
    uploadImg,
    uploadBase64
}