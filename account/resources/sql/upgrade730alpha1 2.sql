-- blind_copy_to to tblemailtemplates
set @query = if ((select count(*) from information_schema.columns where table_schema=database() and table_name='tblemailtemplates' and column_name='blind_copy_to') = 0, 'ALTER TABLE `tblemailtemplates` ADD `blind_copy_to` TEXT NOT NULL AFTER `copyto`', 'DO 0;');
prepare statement from @query;
execute statement;
deallocate prepare statement;

-- hidden_widgets to tbladmins
set @query = if ((select count(*) from information_schema.columns where table_schema=database() and table_name='tbladmins' and column_name='hidden_widgets') = 0, 'ALTER TABLE `tbladmins` ADD `hidden_widgets` TEXT COLLATE utf8_unicode_ci NOT NULL AFTER `password_reset_expiry`', 'DO 0;');
prepare statement from @query;
execute statement;
deallocate prepare statement;

-- add primary key to tbladdonmodules
ALTER TABLE  `tbladdonmodules` ADD  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST ;

-- create jobs queue table
CREATE TABLE `tbljobs_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `method_name` varchar(255) NOT NULL DEFAULT '',
  `input_parameters` text NOT NULL,
  `available_at` datetime NOT NULL,
  `digest_hash` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
