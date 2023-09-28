function onUpdateDatabase()
	logger.info("Updating database to version 41 (optimize house_lists)")
	db.query([[
			ALTER TABLE `house_lists` DROP COLUMN `id`;
		]])

	db.query([[
			ALTER TABLE `house_lists`
			ADD COLUMN `version` bigint NOT NULL DEFAULT 0 AFTER `listid`,
			ADD INDEX `version` (`version`),
			ADD PRIMARY KEY (`house_id`, `listid`);
		]])
	return true
end
