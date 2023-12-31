import express from "express";
import cors from "cors";
import rootRouter from "./routers/rootRouter.js";

const app = express();

app.use(express.json());
app.use(cors());
app.use(express.static("."));

app.listen(8080);

app.use("/api", rootRouter);

import swaggerUi from 'swagger-ui-express';
import swaggerJsDoc from 'swagger-jsdoc';

const options = {
    definition: {
        info: {
            title: "api",
            version: "1.0.0"
        }
    },
    apis: ["src/swagger/index.js"]
}

const specs = swaggerJsDoc(options);

app.use("/swagger", swaggerUi.serve, swaggerUi.setup(specs));

