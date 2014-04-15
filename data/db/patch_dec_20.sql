/** DELETE all empty for site templates as they cause template creation to take more time **/
 
DELETE FROM site_data WHERE
category IN (SELECT sample_site FROM site_template)
AND value = '__EMPTY__';

