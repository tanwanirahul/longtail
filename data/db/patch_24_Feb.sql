DELETE from site_data where value IN (
select id from site_data_value where text = '__EMPTY__'
);

DELETE from site_data_value where text = '__EMPTY__';
