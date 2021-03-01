const Pool=require("pg").Pool;

const pool=new Pool({
    user: "postgres",
    password:"heran",
    database: "afalagi_main",
    host:"localhost",
    port:"5432"
}
);

module.exports=pool;
