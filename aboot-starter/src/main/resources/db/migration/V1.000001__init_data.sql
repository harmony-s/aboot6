/* 2020/02/02 000001 mission */

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Records of dict
-- ----------------------------
REPLACE INTO `sys_dict` VALUES (1, 'user_status', '用户状态', '2019-07-14 10:51:35', 0, NULL, '2019-07-14 10:51:35', NULL);

-- ----------------------------
-- Records of dict_detail
-- ----------------------------
REPLACE INTO `sys_dict_detail` VALUES (1, '激活', 'true', '1', 1, '2019-07-14 10:51:35', 0, NULL, '2019-07-14 10:51:36', NULL);
REPLACE INTO `sys_dict_detail` VALUES (2, '锁定', 'false', '2', 1, '2019-07-14 10:51:35', 0, NULL, '2019-07-14 10:51:36', NULL);

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (1, '系统管理', NULL, b'0', b'1', b'0', '', 0, 990, '系统管理', '', '2019-07-26 17:39:58', 0, NULL, '2020-08-28 18:04:04', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (2, '用户管理', NULL, b'0', b'0', b'0', '/system/user/index', 1, 0, '用户', '/home/user_manage', '2019-07-26 17:40:30', 0, NULL, '2022-02-28 16:22:16', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (3, '角色管理', NULL, b'0', b'1', b'0', '/system/role/index', 1, 0, '角色管理', '/home/role_manage', '2019-07-26 17:40:59', 0, NULL, '2020-08-28 18:04:04', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (4, '权限管理', NULL, b'0', b'0', b'0', '/system/authority/index', 1, 0, '权限管理', '/home/authority_manage', '2019-07-26 17:41:34', 0, NULL, '2020-08-28 18:04:04', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (5, '菜单管理', NULL, b'0', b'1', b'0', '/system/menu/index', 1, 0, '菜单', '/home/menu_manage', '2019-07-26 17:41:52', 0, NULL, '2022-02-28 16:26:21', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (6, '字典管理', NULL, b'0', b'0', b'0', '/system/dictionary/index', 1, 0, '字典管理', '/home/dictionary_manage', '2019-07-26 17:42:12', 0, NULL, '2020-08-28 18:04:04', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (7, '日志管理', NULL, b'0', b'0', b'0', '', 0, 991, '日志管理', '', '2019-07-26 17:43:27', 0, NULL, '2022-02-28 16:12:17', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (8, '操作日志', NULL, b'0', b'1', b'0', '/log/operation_log/index', 7, 0, '操作_设置', '/home/operation_log', '2019-07-26 17:43:53', 0, NULL, '2022-02-28 16:12:31', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (9, '异常日志', NULL, b'0', b'1', b'0', '/log/exception_log/index', 7, 0, '异常', '/home/exception_log', '2019-07-26 17:44:24', 0, NULL, '2022-02-28 16:12:35', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (10, '系统监控', NULL, b'0', b'0', b'0', '', 0, 992, '监控', '', '2019-07-26 17:55:38', 0, NULL, '2022-02-28 16:13:05', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (11, '在线用户', NULL, b'0', b'1', b'0', '/monitor/online_user/index.vue', 10, 0, 'peoples', '/home/online_user', '2019-11-03 11:27:37', 0, NULL, '2022-02-28 16:13:15', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (12, '系统工具', NULL, b'0', b'1', b'0', '', 0, 993, '工具', '', '2019-07-26 20:53:33', 0, NULL, '2022-02-28 16:13:27', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (13, '系统缓存', NULL, b'0', b'1', b'0', '/monitor/redis_manage/index', 12, 1, '清除缓存', '/home/redis_manage', '2019-07-26 17:56:34', 0, NULL, '2022-02-28 16:13:31', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (14, '代码生成', NULL, b'0', b'1', b'0', '/tools/generator/index', 12, 3, 'dev', '/home/generator_code', '2019-09-26 19:22:41', 0, NULL, '2022-02-28 16:25:19', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (15, '生成配置', NULL, b'0', b'0', b'0', '/tools/generator/views/config', 14, 0, '', '/home/generator_config', '2019-09-29 20:22:32', 0, NULL, '2022-02-28 16:25:25', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (16, '存储管理', NULL, b'0', b'0', b'0', '/tools/file/index', 12, 4, '文件', '/home/file_manage', '2019-09-29 20:22:32', 0, NULL, '2022-02-28 16:27:38', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (17, '常用工具', NULL, b'0', b'0', b'0', '', 0, 925, 'running', '', '2019-08-02 18:48:46', 0, NULL, '2022-02-28 16:25:31', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (18, '文件预览', NULL, b'0', b'1', b'0', '/common/file/index.vue', 17, 4, '文章分类', '/home/preview_file', '2019-08-02 11:06:24', 0, NULL, '2022-02-28 16:25:40', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (19, 'markdown', NULL, b'0', b'1', b'1', '/common/markdown/index', 17, 3, 'markdown', '/home/markdown', '2019-08-02 16:59:56', 0, NULL, '2022-02-28 16:25:40', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (20, '富文本', NULL, b'0', b'1', b'0', '/common/editor/index', 17, 2, '文章管理', '/home/editor', '2019-08-02 18:50:47', 0, NULL, '2022-02-28 16:25:40', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (21, '图标库', NULL, b'0', b'1', b'1', '/common/icon/index', 17, 1, 'iconfont', '/home/icon', '2019-08-02 18:54:09', 0, NULL, '2022-02-28 16:25:40', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (22, '平台介绍', NULL, b'0', b'0', b'0', '/introduction/index', 0, 999, '平台介绍', '/home/introduction', '2019-07-27 14:26:42', 0, NULL, '2022-02-28 16:25:42', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (23, '图表展示', NULL, b'0', b'0', b'0', '/dashboard/index', 0, 0, '图表', '/home/dashboard', '2019-08-04 20:10:01', 0, NULL, '2022-02-28 16:25:43', NULL);
REPLACE INTO `sys_menu` (`id`, `name`, `authorities`, `i_frame`, `enabled`, `cache`, `component`, `parent_id`, `sort`, `icon`, `path`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (24, '个人中心', NULL, b'0', b'0', b'0', '/person/index', 0, 1, '个人中心', '/home/person', '2019-08-03 11:29:17', 0, NULL, '2022-02-28 16:25:46', NULL);

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (1, '超级管理员', 'ADMIN', 0, '2018-12-03 12:27:48', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (2, '用户管理', 'USER:all', 0, '2018-12-03 12:28:19', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (3, '用户查询', 'USER:list', 2, '2018-12-03 12:31:35', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (4, '用户创建', 'USER:add', 2, '2018-12-03 12:31:35', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (5, '用户编辑', 'USER:edit', 2, '2018-12-03 12:31:35', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (6, '用户删除', 'USER:del', 2, '2018-12-03 12:31:35', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (7, '角色管理', 'ROLES:all', 0, '2018-12-03 12:28:19', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (8, '角色查询', 'ROLES:list', 7, '2018-12-03 12:31:35', 0, NULL, '2019-07-14 10:51:37', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (9, '角色创建', 'ROLES:add', 7, '2018-12-09 20:10:16', 0, NULL, '2022-02-28 15:58:06', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (10, '角色编辑', 'ROLES:edit', 7, '2018-12-09 20:10:42', 0, NULL, '2022-02-28 15:58:09', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (11, '角色删除', 'ROLES:del', 7, '2018-12-09 20:11:07', 0, NULL, '2022-02-28 15:58:14', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (12, '权限管理', 'PERMISSION:all', 0, '2018-12-09 20:11:37', 0, NULL, '2022-02-28 15:58:27', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (13, '权限查询', 'PERMISSION:list', 12, '2018-12-09 20:11:55', 0, NULL, '2022-02-28 15:58:39', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (14, '权限创建', 'PERMISSION:add', 12, '2018-12-09 20:14:10', 0, NULL, '2022-02-28 15:58:39', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (15, '权限编辑', 'PERMISSION:edit', 12, '2018-12-09 20:15:44', 0, NULL, '2022-02-28 15:58:39', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (16, '权限删除', 'PERMISSION:del', 12, '2018-12-09 20:15:59', 0, NULL, '2022-02-28 15:58:39', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (17, '缓存管理', 'REDIS:all', 0, '2018-12-17 13:53:25', 0, NULL, '2022-02-28 15:58:43', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (18, '缓存查询', 'REDIS:list', 17, '2018-12-17 13:54:07', 0, NULL, '2022-02-28 15:58:49', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (19, '缓存删除', 'REDIS:del', 17, '2018-12-17 13:55:04', 0, NULL, '2022-02-28 15:58:49', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (20, '菜单管理', 'MENU:all', 0, '2018-12-28 17:34:31', 0, NULL, '2022-02-28 15:58:52', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (21, '菜单查询', 'MENU:list', 20, '2018-12-28 17:34:41', 0, NULL, '2022-02-28 15:58:59', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (22, '菜单创建', 'MENU:add', 20, '2018-12-28 17:34:52', 0, NULL, '2022-02-28 15:58:59', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (23, '菜单编辑', 'MENU:edit', 20, '2018-12-28 17:35:20', 0, NULL, '2022-02-28 15:58:59', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (24, '菜单删除', 'MENU:del', 20, '2018-12-28 17:35:29', 0, NULL, '2022-02-28 15:58:59', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (25, '字典管理', 'DICT:all', 0, '2019-04-10 16:24:51', 0, NULL, '2022-02-28 15:59:07', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (26, '字典查询', 'DICT:list', 25, '2019-04-10 16:25:16', 0, NULL, '2022-02-28 15:59:15', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (27, '字典创建', 'DICT:add', 25, '2019-04-10 16:25:29', 0, NULL, '2022-02-28 15:59:15', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (28, '字典编辑', 'DICT:edit', 25, '2019-04-10 16:27:19', 0, NULL, '2022-02-28 15:59:15', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (29, '字典删除', 'DICT:del', 25, '2019-04-10 16:27:30', 0, NULL, '2022-02-28 15:59:15', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (30, '权限日志管理', 'AUTHLOG:all', 0, '2019-07-22 21:17:32', 0, NULL, '2022-02-28 15:59:38', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (31, '权限日志创建', 'AUTHLOG:add', 30, '2019-07-22 21:17:32', 0, NULL, '2022-02-28 15:59:45', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (32, '权限日志编辑', 'AUTHLOG:edit', 30, '2019-07-22 21:17:32', 0, NULL, '2022-02-28 15:59:45', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (33, '权限日志查询', 'AUTHLOG:list', 30, '2019-07-22 21:17:32', 0, NULL, '2022-02-28 15:59:45', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (34, '权限日志删除', 'AUTHLOG:del', 30, '2019-07-22 21:17:32', 0, NULL, '2022-02-28 15:59:45', NULL);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (35, '在线用户管理', 'ONLINE:all', 0, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:30', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (36, '在线用户创建', 'ONLINE:add', 35, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:36', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (37, '在线用户编辑', 'ONLINE:edit', 35, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:36', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (38, '在线用户查询', 'ONLINE:list', 35, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:36', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (39, '在线用户删除', 'ONLINE:del', 35, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:36', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (40, '数据组管理', 'GROUPDATA:all', 0, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:42', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (41, '数据组创建', 'GROUPDATA:add', 40, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:52', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (42, '数据组编辑', 'GROUPDATA:edit', 40, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:52', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (43, '数据组查询', 'GROUPDATA:list', 40, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:52', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (44, '数据组删除', 'GROUPDATA:del', 40, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:52', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (45, '前端配置管理', 'SHOWCONFIG:all', 0, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:00:54', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (46, '前端配置创建', 'SHOWCONFIG:add', 45, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:01', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (47, '前端配置编辑', 'SHOWCONFIG:edit', 45, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:01', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (48, '前端配置查询', 'SHOWCONFIG:list', 45, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:01', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (49, '前端配置删除', 'SHOWCONFIG:del', 45, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:01', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (50, '存储管理', 'LOCALSTORAGE:all', 0, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:11', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (51, '存储创建', 'LOCALSTORAGE:add', 50, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:17', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (52, '存储编辑', 'LOCALSTORAGE:edit', 50, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:17', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (53, '存储查询', 'LOCALSTORAGE:list', 50, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:17', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (54, '存储删除', 'LOCALSTORAGE:del', 50, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:01:17', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (55, '微信配置管理', 'WXCONFIG:all', 0, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:11', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (56, '微信配置创建', 'WXCONFIG:add', 55, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:18', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (57, '微信配置编辑', 'WXCONFIG:edit', 55, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:18', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (58, '微信配置查询', 'WXCONFIG:list', 55, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:18', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (59, '微信配置删除', 'WXCONFIG:del', 55, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:18', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (60, '微信用户管理', 'WXUSER:all', 0, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:23', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (61, '微信用户创建', 'WXUSER:add', 60, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:30', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (62, '微信用户编辑', 'WXUSER:edit', 60, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:30', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (63, '微信用户查询', 'WXUSER:list', 60, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:30', 0);
REPLACE INTO `sys_permission` (`id`, `alias`, `name`, `parent_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES (64, '微信用户删除', 'WXUSER:del', 60, '2022-02-28 15:40:48', 0, NULL, '2022-02-28 16:02:30', 0);

-- ----------------------------
-- Records of role
-- ----------------------------
REPLACE INTO `sys_role` VALUES (1, '超级管理员','ADMIN', '全部', 1,'系统所有权', '2018-11-23 11:04:37', 1, NULL,'2019-08-21 10:14:20', NULL);
REPLACE INTO `sys_role` VALUES (2, '普通管理员',NULL,  '全部', 2,'普通管理员级别为2，使用该角色新增用户时只能赋予比普通管理员级别低的角色', '2019-05-13 14:16:15', 1,  NULL, '2019-09-04 20:18:37', NULL);
REPLACE INTO `sys_role` VALUES (3, '普通用户',NULL, '本级', 3,'用于测试菜单与权限',  '2018-11-23 13:09:06', 1, NULL, '2019-08-11 18:29:07', NULL);

-- ----------------------------
-- Records of sys_roles_menus_map
-- ----------------------------
REPLACE INTO `sys_roles_menus_map` (`menu_id`, `role_id`) VALUES (1, 1);
REPLACE INTO `sys_roles_menus_map` (`menu_id`, `role_id`) VALUES (3, 1);
REPLACE INTO `sys_roles_menus_map` (`menu_id`, `role_id`) VALUES (5, 1);
REPLACE INTO `sys_roles_menus_map` (`menu_id`, `role_id`) VALUES (12, 1);
REPLACE INTO `sys_roles_menus_map` (`menu_id`, `role_id`) VALUES (13, 1);
REPLACE INTO `sys_roles_menus_map` (`menu_id`, `role_id`) VALUES (14, 1);

-- ----------------------------
-- Records of roles_permissions_map
-- ----------------------------
REPLACE INTO `sys_roles_permissions_map` VALUES (1, 1);
REPLACE INTO `sys_roles_permissions_map` VALUES (2, 1);

-- ----------------------------
-- Records of user
-- ----------------------------
REPLACE INTO `sys_user` VALUES (1, 'superAdmin', 'superAdmin', '$2a$10$tX2FSbajRt4xkUo4Sg4TF.V54m/QvoUFpiP9skWwzMqsTEKT44dbW', 0, '18888888888', '123456@qq.com', NULL, 0, b'1', '2019-07-27 19:32:05', '2019-08-29 09:16:54', '2018-08-23 09:11:56',0, NULL, '2020-01-19 13:22:43',NULL);
REPLACE INTO `sys_user` VALUES (2, 'admin', 'admin', '$2a$10$tX2FSbajRt4xkUo4Sg4TF.V54m/QvoUFpiP9skWwzMqsTEKT44dbW', 0, '18888888889', '1234567@qq.com', NULL, 0, b'1', '2019-07-27 19:32:05', '2019-08-29 09:16:54', '2018-08-23 09:11:56',0, NULL, '2020-01-19 13:22:43',NULL);

-- ----------------------------
-- Records of users_roles_map
-- ----------------------------
REPLACE INTO `sys_users_roles_map` VALUES (1, 1);
REPLACE INTO `sys_users_roles_map` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;