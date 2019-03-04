CREATE TABLE `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` VARCHAR(255) NOT NULL COMMENT '用户邮箱',
  `password` VARCHAR(255) NOT NULL COMMENT '用户密码',
  `username` VARCHAR(255) NOT NULL COMMENT '用户昵称',
  `role` VARCHAR(255) NOT NULL COMMENT '用户身份',
  `status` INT(1) NOT NULL COMMENT '用户状态',
  `regTime` DATETIME NOT NULL COMMENT '注册时间',
  `regIp` VARCHAR(255) NOT NULL COMMENT '注册IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `user` VALUES ('1', 'xxx', 'xxxxx', 'xxxxx', 'root', '0', '2017-03-28 09:40:31', '127.0.0.1');
SET FOREIGN_KEY_CHECKS=1;