DELIMITER $$

DROP PROCEDURE IF EXISTS `longtail`.`create_home_master_page` $$
CREATE PROCEDURE `longtail`.`create_home_master_page` ()
BEGIN

DECLARE h_id INT;
SELECT id INTO h_id FROM site where domain IN ('local.designoncloud.com', 'qa.designoncloud.com', 'designoncloud.com');

INSERT INTO master_page(css_text, name, widget_tree, site)
VALUES
('#canvas {background-image: url(''http://content.designoncloud.com/static/img/sites/hashedin/background-pattern.jpg''); background-repeat: repeat-x;}',
'home',
'{"__root":["canvas"],"canvas":["layoutArea"],"layoutArea":["header","Content_Body","footer"],"header":["siteNameText","siteLogoImg","primaryNav"]}',
h_id);

Update page p SET p.master_page = LAST_INSERT_ID() WHERE p.site = h_id AND p.path = '/';

UPDATE master_page
SET css_text = '#canvas {background-image: url(''http://content.designoncloud.com/static/img/sites/hashedin/bg-header.jpg''); background-repeat: repeat-x;}'
WHERE site = h_id AND name = 'default';

END $$

DELIMITER ;



call create_home_master_page();