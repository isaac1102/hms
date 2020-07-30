CREATE TABLE bcu_file (
  file_seq int NOT NULL AUTO_INCREMENT,
  file_path varchar(500) NOT NULL,
  file_id varchar(100) NOT NULL,
  file_nm varchar(200) NOT NULL,
  file_url varchar(200) NOT NULL,
  order_no int DEFAULT NULL,
  file_size int DEFAULT NULL,
  file_type varchar(10) DEFAULT NULL,
  hw_seq int NOT NULL,
  PRIMARY KEY (file_seq),
  KEY bcu_file_fk (hw_seq),
  CONSTRAINT bcu_file_fk FOREIGN KEY (hw_seq) REFERENCES bcu_homework (hw_seq)
);

CREATE TABLE bcu_homework (
  hw_seq int NOT NULL AUTO_INCREMENT,
  title varchar(200) NOT NULL,
  reply varchar(4000) DEFAULT NULL,
  file_seq int DEFAULT NULL,
  confirm_yn char(1) DEFAULT NULL,
  check_yn char(1) DEFAULT NULL,
  reg_dt date DEFAULT NULL,
  modi_dt date DEFAULT NULL,
  reg_id varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (hw_seq),
  KEY bcu_homework_file_seq_IDX (file_seq) USING BTREE
);

CREATE TABLE bcu_member (
  user_id varchar(50) NOT NULL,
  user_nm varchar(50) NOT NULL,
  password varchar(1000) NOT NULL,
  class varchar(100) DEFAULT NULL,
  level int DEFAULT NULL,
  Attending_Yn char(1) DEFAULT NULL,
  check_yn char(1) DEFAULT NULL,
  PRIMARY KEY (user_id)
);