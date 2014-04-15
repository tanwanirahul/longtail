drop database longtail;
create database longtail character set UTF8;
GRANT ALL ON *.* TO 'longtail'@'localhost' IDENTIFIED BY 'longtail';

UPDATE mysql.user SET Password=PASSWORD('gAe1$^795') WHERE User='longtail';
FLUSH PRIVILEGES;

-- Data Patch 
update site_data_value set uuid = concat('text-',uuid) where uuid not like 'text-%';


-- Data Patch for Forms Modification
ALTER table form_data ADD `uuid` varchar(31) default NULL;
UPDATE form_data SET uuid = CONCAT('uuooll',id);
ALTER TABLE form_data DROP PRIMARY KEY, ADD PRIMARY KEY(uuid);
ALTER TABLE form_data DROP id;

ALTER TABLE form_data_values change `form_data` `form_data` varchar(31) NOT NULL;
UPDATE form_data_values SET form_data = CONCAT('uuooll',form_data) where form_data not like 'uuoollu%';
ALTER TABLE form_data_values DROP PRIMARY KEY, ADD PRIMARY KEY(form_data, mapkey);


-- Adding layout into the tree structure
UPDATE site SET layout = NULL;
ALTER TABLE site CHANGE layout layout BIGINT(20);

ALTER TABLE site_data_value CHANGE required required BIT(1) DEFAULT 0 NULL;
update user set membership = 'Trial' where membership = 'Free';

-- For serving images through CloudFront via content subdomain 
select css_styles from csspreset where css_styles like '%http://static.hashedin.com/static/libs%';
UPDATE csspreset set css_styles = replace(css_styles, 'http://static.hashedin.com/static/libs', 'http://content.designoncloud.com/static/libs');

select path from site_data_value where path like '%http://static.hashedin.com/static/libs%';
UPDATE site_data_value set path = replace(path, 'http://static.hashedin.com/static/libs', 'http://content.designoncloud.com/static/libs');

select path from site_data_value where path like '/static/img%';
UPDATE site_data_value set path = replace(path, '/static/img', 'http://content.designoncloud.com/static/img') where dtype = 'ImageDataItem' and path like '/static/img%';

select path from site_data_value where path like '../static/img%';
UPDATE site_data_value set path = replace(path, '../static/img', 'http://content.designoncloud.com/static/img') where dtype = 'ImageDataItem' and path like '../static/img%';

select css_styles from csspreset where css_styles like '%url(''/static/img%';
UPDATE csspreset set css_styles = replace(css_styles, '/static/img', 'http://content.designoncloud.com/static/img') where css_styles like '%url(''/static/img%';

select generating_function from csspreset where generating_function like '%url(''/static/img%';
UPDATE csspreset set generating_function = replace(generating_function, '/static/img', 'http://content.designoncloud.com/static/img') where generating_function like '%url(''/static/img%';

select css_styles from csspreset where css_styles like '%url(''../static/css%';
UPDATE csspreset set css_styles = replace(css_styles, '../static/css', 'http://content.designoncloud.com/static/css') where css_styles like '%url(''../static/css%';

select generating_function from csspreset where generating_function like '%url(''../static/css%';
UPDATE csspreset set generating_function = replace(generating_function, '../static/css', 'http://content.designoncloud.com/static/css') where generating_function like '%url(''../static/css%';

select css_styles from csspreset where css_styles like '%url(''../static/img%';
UPDATE csspreset set css_styles = replace(css_styles, '../static/img', 'http://content.designoncloud.com/static/img') where css_styles like '%url(''../static/img%';

select generating_function from csspreset where generating_function like '%url(''../static/img%';
UPDATE csspreset set generating_function = replace(generating_function, '../static/img', 'http://content.designoncloud.com/static/img') where generating_function like '%url(''../static/img%';

select element from cssselector_bundle_custom_styles where element like '%''/static/img%';
UPDATE cssselector_bundle_custom_styles set element = replace(element, '/static/img', 'http://content.designoncloud.com/static/img') where element like '%''/static/img%';

-- To be used in case you use back of production in QA
UPDATE site set domain = replace(domain, 'hashedin.com', 'qa.hashedin.com');

-- For HashedIn to DesignOnCloud
select path from site_data_value where path like '%content.hashedin.com/%';
UPDATE site_data_value set path = replace(path, 'content.hashedin.com/', 'content.designoncloud.com/') where dtype = 'ImageDataItem' and path like '%content.hashedin.com/%';

select css_styles from csspreset where css_styles like '%content.hashedin.com/%';
UPDATE csspreset set css_styles = replace(css_styles, 'content.hashedin.com/', 'content.designoncloud.com/') where css_styles like '%content.hashedin.com/%';

select generating_function from csspreset where generating_function like '%content.hashedin.com/%';
UPDATE csspreset set generating_function = replace(generating_function, 'content.hashedin.com/', 'content.designoncloud.com/') where generating_function like '%content.hashedin.com/%';

select css_styles from csspreset where css_styles like '%//hashedin.com/%';
UPDATE csspreset set css_styles = replace(css_styles, 'hashedin.com/', 'content.designoncloud.com/') where css_styles like '%//hashedin.com/%';

select generating_function from csspreset where generating_function like '%//hashedin.com/%';
UPDATE csspreset set generating_function = replace(generating_function, 'hashedin.com/', 'content.designoncloud.com/') where generating_function like '%//hashedin.com/%';

select element from cssselector_bundle_custom_styles where element like '%content.hashedin.com/%';
UPDATE cssselector_bundle_custom_styles set element = replace(element, 'content.hashedin.com/', 'content.designoncloud.com/') where element like '%content.hashedin.com/%';

SELECT css_text FROM master_page m where css_text like '%content.hashedin.com/%';
UPDATE master_page set css_text = replace(css_text, 'content.hashedin.com/', 'content.designoncloud.com/') where css_text like '%content.hashedin.com/%';

UPDATE site set domain = replace(domain, 'hashedin.com', 'designoncloud.com');
UPDATE user_site_role_map set mapkey = replace(mapkey, 'hashedin.com', 'designoncloud.com');

UPDATE site_data_value set text = replace(text, '/hashedin.com', '/designoncloud.com');
UPDATE site_data_value set text = replace(text, 'HashedIn', 'DesignOnCloud');


-- To be used for changing user attributes to some customer id (password is password)
select * from user where email like '%him%';
update user set email = 'support@omshreebhoomi.com', user_name = 'support@omshreebhoomi.com', full_name = 'Om Shree Bhoomi', membership = 'Basic', password = 'ef1ff621c5bcf6e2b07ee6d1f7053d76' where id = 6;
update user set email = 'support@thespicyhub.com', user_name = 'support@thespicyhub.com', full_name = 'The Spicy Hub', membership = 'Basic', password = 'ef1ff621c5bcf6e2b07ee6d1f7053d76' where id = 11;

update user_site_role_map set user = 6 where mapkey = 'omshreebhoomi.hashedin.com';
update user_site_role_map set user = 11 where mapkey = 'thespicyhub.hashedin.com';


-- To remove custom font-family from CSS for HashedIn brandsite
DELETE c
FROM cssselector_bundle_custom_styles c
INNER JOIN site_styles_styles sss ON sss.styles = c.cssselector_bundle
INNER JOIN site_styles ss ON ss.id = sss.site_styles
INNER JOIN site s ON s.id = ss.site
WHERE s.domain = 'hashedin.com' AND c.mapkey = 'fontFamily';

-- To remove custom font-size from CSS for HashedIn brandsite
DELETE c
FROM cssselector_bundle_custom_styles c
INNER JOIN site_styles_styles sss ON sss.styles = c.cssselector_bundle
INNER JOIN site_styles ss ON ss.id = sss.site_styles
INNER JOIN site s ON s.id = ss.site
WHERE s.domain = 'hashedin.com' AND c.mapkey = 'fontSize';

-- To remove CSS selectors with no property for HashedIn brandsite
DELETE sss
FROM cssselector_bundle_custom_styles c
RIGHT JOIN site_styles_styles sss ON sss.styles = c.cssselector_bundle
INNER JOIN site_styles ss ON ss.id = sss.site_styles
INNER JOIN site s ON s.id = ss.site
WHERE s.domain = 'hashedin.com' AND c.cssselector_bundle IS NULL;


-- To update TextHeadingDataItem to TextDataItem with TextDataItemType
UPDATE `site_data_value`
SET dtype = 'TextDataItem', type = CONCAT('h', CAST(priority AS CHAR)), priority = NULL
WHERE dtype = 'TextHeadingDataItem';


--- Page Data Migration
ALTER TABLE page ADD COLUMN site BIGINT(20);
ALTER TABLE page ADD COLUMN item_index INTEGER;
UPDATE page P, site_pagelist S SET P.site = S.site WHERE S.pages = P.id;
UPDATE page P, site_pagelist S SET P.item_index = S.item_index WHERE S.pages = P.id;

RENAME TABLE site_pagelist TO tmp_site_pagelist;

ALTER TABLE page ADD column widget_instance BIGINT(20);
UPDATE page P, site_path_map S SET P.widget_instance = S.path_map WHERE P.id = S.mapkey AND S.site = P.site;

RENAME TABLE site_path_map TO tmp_site_path_map;

update site_data_value
set dtype = 'WidgetInstance'
where dtype = 'ListDataInstance';

-- For moving images from themes folder to img/sites 
select css_styles from csspreset where css_styles like '%/static/css/themes/hashedin/img%';
UPDATE csspreset set css_styles = replace(css_styles, '/static/css/themes/hashedin/img', '/static/img/sites/hashedin') where css_styles like '%/static/css/themes/hashedin/img%';

select generating_function from csspreset where generating_function like '%/static/css/themes/hashedin/img%';
UPDATE csspreset set generating_function = replace(generating_function, '/static/css/themes/hashedin/img', '/static/img/sites/hashedin') where generating_function like '%/static/css/themes/hashedin/img%';

-- Delete themes from blank templates
DELETE tct
FROM site s
INNER JOIN theme_collection_themes tct on tct.theme_collection = s.theme
WHERE s.domain LIKE 'blank%.templates.%';
